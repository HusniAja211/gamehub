<?php

require_once('../core/config.php');
include __DIR__ . "/layout/header.php";
include __DIR__ . "/layout/navbar.php";
require_once "../function/func.php";

// Panggil fungsi untuk mendapatkan data developer
$devs = getDev($conn);
?>

<main class="p-6 flex-1 bg-gray-200">
    <h1 class="text-center text-xl font-bold mb-6">Tentang Kami</h1>

    <section class="text-center py-10">
        <!-- <h2 class="text-4xl font-bold mb-4">Meet Our Team</h2>
        <div class="w-16 h-1 bg-blue-500 mx-auto mb-8"></div> -->

        <br>

        <div class="grid grid-cols-3 gap-6">
    <?php foreach ($devs as $dev): ?>
        <div class="bg-white p-6 rounded-xl shadow-md relative overflow-hidden mx-auto mb-6 max-w-sm">
            <div class="relative group">
                <img src="<?= $dev['gambar_developer']; ?>" alt="<?= $dev['nama_developer']; ?>" class="w-full h-48 object-cover rounded-t-xl">

                <!-- Hover Icons -->
                <div class="absolute inset-0 bg-black bg-opacity-50 flex justify-center items-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                    <a href="updateDev.php?id=<?= $dev['id_developer']; ?>" class="text-white mx-2">
                        <i class="fas fa-edit text-3xl"></i>
                    </a>
                    <a href="../function/deleteDev.php?id_developer=<?= $dev['id_developer']; ?>" class="text-white mx-2" onclick="return confirm('Apakah Anda yakin ingin menghapus game ini?');">
                        <i class="fas fa-trash text-3xl"></i>
                    </a>
                </div>
            </div>

            <h3 class="text-lg font-semibold mt-2 text-center"><?= $dev['nama_developer']; ?></h3>
            <p class="text-sm text-gray-600 text-center"><?= $dev['deskripsi']; ?></p>

            <!-- Sosial Media -->
            <div class="flex justify-center gap-3 mt-3">
                <?php if (!empty($dev['instagram'])): ?>
                    <a href="<?= htmlspecialchars($dev['instagram']); ?>" class="text-pink-500 text-xl">
                        <i class="fab fa-instagram"></i>
                    </a>
                <?php endif; ?>
                <?php if (!empty($dev['linkedin'])): ?>
                    <a href="<?= htmlspecialchars($dev['linkedin']); ?>" class="text-blue-600 text-xl">
                        <i class="fab fa-linkedin"></i>
                    </a>
                <?php endif; ?>
                <?php if (!empty($dev['github'])): ?>
                    <a href="<?= htmlspecialchars($dev['github']); ?>" class="text-gray-800 text-xl">
                        <i class="fab fa-github"></i>
                    </a>
                <?php endif; ?>
            </div>
        </div>
    <?php endforeach; ?>
</div>

        
       
    </section>

     <!-- Pagination & Tombol Tambah -->
     <div class="flex justify-between items-center mt-auto pt-6">
        <!-- Tombol Tambah (Sisi Kiri) -->
        <a href="insertDev.php" class="bg-blue-500 text-white p-4 rounded-full shadow-lg hover:bg-blue-600">
            <i class="fas fa-plus text-xl"></i>
        </a>
    </div>

</main>
<?php include __DIR__ . "/layout/footer.php"; ?>
