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

<main class="flex items-center justify-center min-h-screen bg-gray-200">
    <div id="category-screen" class="container mx-auto p-6 bg-white shadow-lg rounded-lg max-w-xs">
        <h1 class="text-2xl font-semibold text-gray-800 mb-4 text-center">Selamat Datang di Tebak Kata!</h1>
        <h2 class="text-xl font-medium text-gray-700 mb-4 text-center">Pilih Kategori Soal</h2>
        <form action="quiz.php" method="GET">
            <select id="category-select" name="category" required class="w-full p-3 border border-gray-300 rounded-md text-lg mb-4">
                <option value="" disabled selected>Pilih Kategori</option>
                <?php foreach ($hasilKategori as $kategori): ?>
                    <option value="<?= htmlspecialchars($kategori['id']) ?>">
                        <?= htmlspecialchars($kategori['kategori']) ?>
                    </option>
                <?php endforeach; ?>
            </select>
            <button type="submit" class="w-full p-3 bg-blue-600 text-white rounded-md text-lg hover:bg-blue-700 transition duration-200 ease-in-out mb-4">Mulai Quiz</button>
        </form>
        <form action="index.php" method="get">
            <button type="submit" class="w-full p-3 bg-red-600 text-white rounded-md text-lg hover:bg-red-700 transition duration-200 ease-in-out">Kembali</button>
        </form>
    </div>
</main>

<?php include __DIR__ . '/../../layout/footer.php'; ?>
