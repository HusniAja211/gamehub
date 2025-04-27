<?php

require_once('../core/config.php');
include __DIR__ . "/layout/header.php";
include __DIR__ . "/layout/navbar.php";
require_once "../function/func.php";

$images = getGalery($conn); // Sekarang akan mendapatkan semua gambar

// Pagination
$perPage = 15; // 3 row x 5 per row
$totalImages = count($images);
$totalPages = ceil($totalImages / $perPage);
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page = max(1, min($page, $totalPages));
$start = ($page - 1) * $perPage;
$displayImages = array_slice($images, $start, $perPage);
?>

<main class="p-6 flex-1 bg-gray-200 flex flex-col justify-start">
    <h1 class="text-center text-xl font-bold mb-6">Galery</h1>

    <!-- Grid x 5 column -->
   <div class="grid grid-cols-5 gap-4">    
    <?php foreach ($displayImages as $galery) : ?>
        <div class="relative group bg-white rounded-lg shadow-lg overflow-hidden p-2 flex items-center justify-center h-40">
            <img src="<?= $galery['nama_galery'] ?>" class="max-w-full max-h-full object-contain">
           
            <!-- Overlay hitam dengan ikon delete -->
            <div class="absolute inset-0 bg-black bg-opacity-50 opacity-0 group-hover:opacity-100 flex items-center justify-center transition-opacity">
                <a href="../function/deleteGalery.php?id_galery=<?= $galery['id_galery'] ?>" class="text-red-500 text-4xl flex items-center justify-center" onclick="return confirm('Apakah Anda yakin ingin menghapus game ini?');">
                    <i class="fas fa-trash-alt"></i>
                </a>
            </div>
        </div>
    <?php endforeach; ?>
</div>
    
    <div class="flex justify-between items-center mt-auto pt-6">
        <!-- Tombol Tambah (Sisi Kiri) -->
        <a href="insertGalery.php" class="bg-blue-500 text-white p-4 rounded-full shadow-lg hover:bg-blue-600">
            <i class="fas fa-plus text-xl"></i>
        </a>
    </div>

</main>

<?php include __DIR__ . "/layout/footer.php"; ?>