<?php
require_once(__DIR__ . '/../../../core/config.php');
include __DIR__ . '/../../layout/header.php';
session_start();

$categoryId = $_GET['category'] ?? null;
$showQuiz = true;
$showResult = false;
$errorMessage = "";

if (!$categoryId) {
    $errorMessage = "Kategori belum dipilih. <a href='pilihKategori.php' class='text-blue-500 hover:underline'>Kembali</a>";
    $showQuiz = false;
} else {
    $stmt = $conn->prepare("SELECT * FROM kategori WHERE id = ?");
    $stmt->bind_param("i", $categoryId);
    $stmt->execute();
    $kategori = $stmt->get_result()->fetch_assoc();
    $stmt->close();

    if (!$kategori) {
        $errorMessage = "Kategori tidak ditemukan. <a href='pilihKategori.php' class='text-blue-500 hover:underline'>Kembali</a>";
        $showQuiz = false;
    }
}

if ($showQuiz) {
    // Ambil soal dari database
    $stmt = $conn->prepare("SELECT * FROM soal WHERE id_kategori = ?");
    $stmt->bind_param("i", $categoryId);
    $stmt->execute();
    $hasilSoal = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    $stmt->close();

    // Inisialisasi session jika belum ada
    $_SESSION['current_question'] = $_SESSION['current_question'] ?? 0;
    $_SESSION['answers'] = $_SESSION['answers'] ?? [];
    
    // Pastikan waktu mulai hanya di-set saat kuis dimulai
    if (!isset($_SESSION['time_start'])) {
        $_SESSION['time_start'] = time();
    }

    $currentIndex = $_SESSION['current_question'];
    $totalSoal = count($hasilSoal);
    $quizDuration = 5 * 60; // durasi dalam detik

    // Cek jika waktu kuis habis
    if (time() - $_SESSION['time_start'] > $quizDuration) {
        $_SESSION['current_question'] = $totalSoal;
    }

    if ($currentIndex >= $totalSoal) {
        // Hitung skor jika kuis selesai
        $correctAnswers = 0;
        foreach ($_SESSION['answers'] as $soal_id => $jawaban_user) {
            $stmt = $conn->prepare("SELECT jawaban FROM soal WHERE id = ?");
            $stmt->bind_param("i", $soal_id);
            $stmt->execute();
            $result = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            if ($result['jawaban'] === $jawaban_user) {
                $correctAnswers++;
            }
        }
        $_SESSION['skor_akhir'] = $correctAnswers * 10;
        $showQuiz = false;
        $showResult = true;
    } else {
        // Menampilkan soal dan opsi jawaban
        $soal = $hasilSoal[$currentIndex];
        $jawabanBenar = htmlspecialchars($soal['jawaban']);
        
        // Ambil jawaban lain secara acak
        $stmt = $conn->prepare("SELECT jawaban_asal FROM jawaban_asal WHERE id_kategori = ? AND jawaban_asal != ? ORDER BY RAND() LIMIT 3");
        $stmt->bind_param("is", $categoryId, $jawabanBenar);
        $stmt->execute();
        $hasilJawabanAsal = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        // Pilihan jawaban acak
        $opsiJawaban = [$jawabanBenar];
        foreach ($hasilJawabanAsal as $row) {
            $opsiJawaban[] = $row['jawaban_asal'];
        }
        while (count($opsiJawaban) < 4) {
            $opsiJawaban[] = "Pilihan lain";
        }
        shuffle($opsiJawaban);
    }
}

// Menangani jawaban yang dikirim
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['jawaban'])) {
    $_SESSION['answers'][$soal['id']] = $_POST['jawaban'];
    $_SESSION['current_question']++;
    header("Location: " . $_SERVER['PHP_SELF'] . "?category=$categoryId");
    exit();
}
?>

    <style>
        body {
            background-color: #202047;
        }
    </style>

    <script>
        let timeLeft = <?= max(0, $quizDuration - (time() - $_SESSION['time_start'])) ?>;
        function updateTimer() {
            if (timeLeft <= 0) {
                document.getElementById("quiz-form").submit();
            } else {
                document.getElementById("timer").innerText = "Sisa Waktu: " + timeLeft + " detik";
                timeLeft--;
                setTimeout(updateTimer, 1000);
            }
        }
        window.onload = updateTimer;
    </script>
</head>

<main class="flex items-center justify-center min-h-screen bg-gray-200">
    <?php if ($errorMessage): ?>
        <div class="max-w-4xl mx-auto p-5 bg-red-300 text-red-800 rounded-lg mb-6"><?= $errorMessage ?></div>
    <?php endif; ?>
    
    <?php if ($showQuiz): ?>
        <div class="max-w-lg mx-auto bg-pink-100 p-6 rounded-lg shadow-lg">
            <h1 class="text-2xl font-semibold text-center text-gray-800 mb-4">Quiz Kategori: <?= htmlspecialchars($kategori['kategori']) ?></h1>
            <div id="timer" class="text-xl font-bold text-red-600 mb-4"></div>
            <form action="" method="POST" id="quiz-form">
                <div class="question mb-4">
                    <h3 class="text-lg font-medium text-gray-800"><?= ($currentIndex + 1) . ". " . htmlspecialchars($soal['soal']) ?></h3>
                    <?php foreach ($opsiJawaban as $jawaban): ?>
                        <div class="mb-2">
                            <input type="radio" name="jawaban" value="<?= htmlspecialchars($jawaban) ?>" class="mr-2" required>
                            <label class="text-gray-700"><?= htmlspecialchars($jawaban) ?></label>
                        </div>
                    <?php endforeach; ?>
                </div>
                <button type="submit" class="w-full py-2 px-4 bg-green-500 text-white rounded-lg hover:bg-green-600">Lanjut</button>
            </form>
        </div>
    <?php endif; ?>

    <?php if ($showResult): ?>
        <div class="max-w-lg mx-auto bg-pink-100 p-6 rounded-lg shadow-lg">
            <h1 class="text-2xl font-semibold text-center text-gray-800 mb-4">Quiz Selesai</h1>
            <p class="text-lg text-gray-800">Skor Anda: <?= $_SESSION['skor_akhir'] ?? 0 ?> / 100</p>
            <a href="pilihKategori.php" class="text-blue-500 hover:underline mt-4 inline-block" onclick="<?php session_destroy(); ?>">Kembali</a>
        </div>
    <?php endif; ?>
</main>
<?php include __DIR__ . '/../../layout/footer.php';?>

