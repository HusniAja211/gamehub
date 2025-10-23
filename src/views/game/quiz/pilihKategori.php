<?php
require_once(__DIR__ . '/../../../core/config.php');
include __DIR__ . '/../../layout/header.php';

// Ambil data kategori dari database
$stmt = $conn->prepare("SELECT * FROM kategori");
$stmt->execute();
$hasilKategori = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
$stmt->close();
$conn->close();
?>

<main class="flex items-center justify-center min-h-screen bg-gradient-to-br from-blue-50 to-blue-100">
    <div id="category-screen"
        class="w-[90%] max-w-md bg-white shadow-xl rounded-2xl border border-blue-200 p-8 text-center transform transition duration-300 hover:scale-[1.01]">
        
        <div class="mb-6">
            <div class="flex justify-center mb-3">
                <div class="bg-blue-100 p-3 rounded-full">
                    💡
                </div>
            </div>
            <h1 class="text-3xl font-bold text-blue-700 mb-1">Tebak Kata!</h1>
            <p class="text-blue-600 text-base">Pilih kategori untuk memulai permainan</p>
        </div>

        <form action="quiz.php" method="GET" class="space-y-5">
            <div class="text-left">
                <label for="category-select" class="block text-blue-800 font-semibold mb-2 text-sm">Kategori Soal</label>
                <select id="category-select" name="category" required
                    class="w-full p-3 border border-blue-300 rounded-lg text-blue-800 bg-blue-50 focus:outline-none focus:ring-2 focus:ring-blue-500 transition duration-200">
                    <option value="" disabled selected>Pilih Kategori</option>
                    <?php foreach ($hasilKategori as $kategori): ?>
                        <option value="<?= htmlspecialchars($kategori['id']) ?>">
                            <?= htmlspecialchars($kategori['kategori']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <button type="submit"
                class="w-full py-3 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 active:bg-blue-800 transition duration-200 ease-in-out shadow-md">
                🎯 Mulai Quiz
            </button>
        </form>

        <form action="index.php" method="get" class="mt-4">
            <button type="submit"
                class="w-full py-3 bg-white text-blue-700 border border-blue-400 font-semibold rounded-lg hover:bg-blue-50 active:bg-blue-100 transition duration-200 ease-in-out">
                ⬅️ Kembali
            </button>
        </form>
    </div>
</main>

<?php include __DIR__ . '/../../layout/footer.php'; ?>
