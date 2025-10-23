<?php
require_once('../core/config.php');
include __DIR__ . "/layout/header.php";
include __DIR__ . "/layout/navbar.php";
require_once "../function/func.php";

// Tentukan jumlah game per halaman
$gamesPerPage = 9; // 9 card per halaman

// Ambil jumlah total game
$totalGames = getTotalGames($conn);

// Hitung total halaman
$totalPages = ceil($totalGames / $gamesPerPage);

// Ambil halaman saat ini
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page = max($page, 1); // Pastikan halaman tidak kurang dari 1
$page = min($page, $totalPages); // Pastikan halaman tidak lebih dari total halaman

// Hitung offset berdasarkan halaman yang aktif
$offset = ($page - 1) * $gamesPerPage;

// Ambil data game berdasarkan halaman
$hasilGame = getGame($conn, $gamesPerPage, $offset);
?>

<main class="p-6 flex-1 bg-gray-200 flex flex-col justify-between">
    <h1 class="text-center text-xl font-bold mb-6">Laman Gim</h1>

    <!-- Games Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 gap-6 mb-12">
        <?php if (!empty($hasilGame)): ?>
            <?php foreach ($hasilGame as $game): ?>
                <div class="bg-white rounded-lg shadow-md overflow-hidden p-4 text-center space-y-4">
                    <p class="text-lg font-semibold text-gray-800"><?= htmlspecialchars($game['nama_game']) ?></p>
                    <div class="relative group flex justify-center items-center w-full">
                        <!-- Gambar Game -->
                        <img src="<?= htmlspecialchars($game['gambar_game']) ?>" alt="Game Image" class="w-full h-50 object-cover rounded-lg shadow-md transition-transform duration-300">
                        
                        <!-- Overlay -->
                        <!-- <div class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity duration-300 rounded-lg">
                            <a href="updateGame.php?id_game=<?= $game['id_game'] ?>" class="text-white bg-blue-500 p-2 rounded-full mx-2 hover:bg-blue-700">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="../function/deleteGame.php?id_game=<?= $game['id_game'] ?>" class="text-white bg-red-500 p-2 rounded-full mx-2 hover:bg-red-700" onclick="return confirm('Apakah Anda yakin ingin menghapus game ini?');">
                                <i class="fas fa-trash"></i>
                            </a>
                        </div> -->
                    </div>
                    
                    <p class="text-sm text-gray-600"><?= htmlspecialchars($game['nama_anggota']) ?></p>
                    <a href="gameDetail.php?id_game=<?= $game['id_game'] ?>" class="text-blue-500 hover:underline text-sm">Lihat Detail</a>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="col-span-full flex flex-col items-center justify-center bg-yellow-100 border-2 border-yellow-400 text-yellow-700 rounded-lg p-6">                
                <p class="text-xl font-semibold">Oops! Belum ada data game yang tersedia.</p>
                <p class="text-sm text-gray-600 mt-1">Silakan tambahkan game baru untuk mengisi daftar ini.</p>
            </div>
        <?php endif; ?>
    </div>

    <!-- Pagination & Tombol Tambah -->
    <!-- <div class="flex justify-between items-center mt-auto pt-6"> -->
        <!-- Tombol Tambah (Sisi Kiri) -->
        <!-- <a href="insertGame.php" class="bg-blue-500 text-white p-4 rounded-full shadow-lg hover:bg-blue-600">
            <i class="fas fa-plus text-xl"></i>
        </a>
    </div> -->
</main>

<?php include __DIR__ . "/layout/footer.php"; ?>
