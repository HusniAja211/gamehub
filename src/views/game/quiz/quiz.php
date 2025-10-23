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
    // Ambil semua soal dari kategori
    $stmt = $conn->prepare("SELECT * FROM soal WHERE id_kategori = ?");
    $stmt->bind_param("i", $categoryId);
    $stmt->execute();
    $hasilSoal = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    $stmt->close();

    $_SESSION['current_question'] = $_SESSION['current_question'] ?? 0;
    $_SESSION['answers'] = $_SESSION['answers'] ?? [];
    
    if (!isset($_SESSION['time_start'])) {
        $_SESSION['time_start'] = time();
    }

    $currentIndex = $_SESSION['current_question'];
    $totalSoal = count($hasilSoal);
    $quizDuration = 5 * 60; // 5 menit

    // Cek waktu habis
    if (time() - $_SESSION['time_start'] > $quizDuration) {
        $_SESSION['current_question'] = $totalSoal;
    }

    if ($currentIndex >= $totalSoal) {
        // Hitung skor akhir
        $correctAnswers = 0;
        foreach ($_SESSION['answers'] as $soal_id => $jawaban_user) {
            $stmt = $conn->prepare("SELECT jawaban FROM soal WHERE id = ?");
            $stmt->bind_param("i", $soal_id);
            $stmt->execute();
            $result = $stmt->get_result()->fetch_assoc();
            $stmt->close();
            if ($result && $result['jawaban'] === $jawaban_user) {
                $correctAnswers++;
            }
        }
        $_SESSION['skor_akhir'] = $correctAnswers * 10;
        $showQuiz = false;
        $showResult = true;
    } else {
        // Soal aktif
        $soal = $hasilSoal[$currentIndex];
        $jawabanBenar = htmlspecialchars($soal['jawaban']);

        // Ambil jawaban asal berdasarkan fid_soal
        $stmt = $conn->prepare("SELECT jawaban_asal FROM jawaban_asal WHERE id_soal = ? ORDER BY RAND()");
        $stmt->bind_param("i", $soal['id']);
        $stmt->execute();
        $hasilJawabanAsal = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

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

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['jawaban'])) {
    $_SESSION['answers'][$soal['id']] = $_POST['jawaban'];
    $_SESSION['current_question']++;
    header("Location: " . $_SERVER['PHP_SELF'] . "?category=$categoryId");
    exit();
}
?>

<script>
    let timeLeft = <?= max(0, $quizDuration - (time() - $_SESSION['time_start'])) ?>;
    function updateTimer() {
        if (timeLeft <= 0) {
            document.getElementById("quiz-form").submit();
        } else {
            document.getElementById("timer").innerText = "⏱️ " + timeLeft + " detik tersisa";
            timeLeft--;
            setTimeout(updateTimer, 1000);
        }
    }
    window.onload = updateTimer;
</script>

<main class="flex items-center justify-center min-h-screen bg-gradient-to-br from-blue-50 to-blue-100">
    <?php if ($errorMessage): ?>
        <div class="max-w-md mx-auto p-5 bg-red-100 border border-red-300 text-red-700 rounded-xl shadow-lg">
            <?= $errorMessage ?>
        </div>
    <?php endif; ?>
    
    <?php if ($showQuiz): ?>
        <div class="w-[90%] max-w-md mx-auto bg-white p-8 rounded-2xl shadow-xl border border-blue-200">
            <h1 class="text-2xl font-bold text-center text-blue-700 mb-3">
                Kategori: <?= htmlspecialchars($kategori['kategori']) ?>
            </h1>
            <div id="timer" class="text-lg font-semibold text-blue-600 text-center mb-5"></div>

            <form action="" method="POST" id="quiz-form" class="space-y-4">
                <div class="question">
                    <h3 class="text-lg font-medium text-gray-800 mb-4">
                        <?= ($currentIndex + 1) . ". " . htmlspecialchars($soal['soal']) ?>
                    </h3>
                    <?php foreach ($opsiJawaban as $jawaban): ?>
                        <label class="flex items-center gap-4 p-2 border border-blue-100 rounded-lg hover:bg-blue-50 transition">
                            <input type="radio" name="jawaban" value="<?= htmlspecialchars($jawaban) ?>" required>
                            <span class="text-gray-800"><?= htmlspecialchars($jawaban) ?></span>
                        </label>
                    <?php endforeach; ?>
                </div>

                <button type="submit"
                    class="w-full py-3 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 active:bg-blue-800 transition shadow-md">
                    Lanjut ➜
                </button>
            </form>
        </div>
    <?php endif; ?>

    <?php if ($showResult): ?>
        <div class="w-[90%] max-w-md mx-auto bg-white p-8 rounded-2xl shadow-xl border border-blue-200 text-center">
            <h1 class="text-2xl font-bold text-blue-700 mb-4">🎉 Quiz Selesai!</h1>
            <p class="text-lg text-gray-700 mb-4">Skor Anda: 
                <span class="font-semibold text-blue-600"><?= $_SESSION['skor_akhir'] ?? 0 ?></span> / 100
            </p>
            <a href="pilihKategori.php"
                class="inline-block px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold shadow-md"
                onclick="<?php session_destroy(); ?>">
                🔁 Coba Lagi
            </a>
        </div>
    <?php endif; ?>
</main>

<?php include __DIR__ . '/../../layout/footer.php'; ?>
