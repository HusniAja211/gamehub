<?php
require_once('../core/config.php');
include __DIR__ . "/layout/header.php";
include __DIR__ . "/layout/navbar.php";
require_once "../function/func.php";

// Panggil fungsi untuk mendapatkan data developer
$devs = getDev($conn);
?>

<main class="p-6 flex-1 bg-gray-200">
    <!-- Bagian 1: Tentang Website Ini -->
    <section class="mb-12 bg-white p-8 rounded-xl shadow-md">
        <h1 class="text-center text-3xl font-bold mb-6">Tentang Website Ini</h1>
        <div class="max-w-4xl mx-auto">
            <p class="text-lg mb-4">
                Selamat datang di TemanTusa! Website ini didedikasikan untuk menyimpan game yang dapat anda mainkan kapan saja!
            </p>
            <p class="text-lg mb-4">
                Misi kami adalah menciptakan database game yang komprehensif dan menghubungkan pemain dengan pengembang 
                untuk membangun komunitas gaming yang lebih kuat.
            </p>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-8">
                <div class="bg-blue-50 p-6 rounded-lg">
                    <h3 class="text-xl font-semibold mb-3 text-blue-700">Fitur</h3>
                    <ul class="list-disc pl-5 space-y-2">
                        <li>Database game dengan informasi detail</li>
                        <li>Profil dan portofolio pengembang</li>
                    </ul>
                </div>
                <div class="bg-green-50 p-6 rounded-lg">
                    <h3 class="text-xl font-semibold mb-3 text-green-700">Teknologi yang Digunakan</h3>
                    <ul class="list-disc pl-5 space-y-2">
                        <li>PHP untuk backend</li>
                        <li>MySQL untuk database</li>
                        <li>Tailwind CSS untuk tampilan</li>
                        <li>JavaScript untuk interaktivitas</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Bagian 2: Tentang Pengembang (Developer) -->
    <section class="text-center py-10">
        <h1 class="text-3xl font-bold mb-6">Tim Pengembang Kami</h1>
        <div class="w-16 h-1 bg-blue-500 mx-auto mb-8"></div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 justify-items-center">
            <?php foreach ($devs as $dev): ?>
                <div class="bg-white p-6 rounded-xl shadow-md relative overflow-hidden w-full max-w-sm">
                    <div class="relative group">
                        <img src="<?= $dev['gambar_developer']; ?>" alt="<?= $dev['nama_developer']; ?>" class="w-full h-48 object-cover rounded-t-xl">

                        <!-- Ikon Edit/Hapus -->
                        <!-- <div class="absolute inset-0 bg-black bg-opacity-50 flex justify-center items-center opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                            <a href="updateDev.php?id=<?= $dev['id_developer']; ?>" class="text-white mx-2">
                                <i class="fas fa-edit text-3xl"></i>
                            </a>
                            <a href="../function/deleteDev.php?id_developer=<?= $dev['id_developer']; ?>" class="text-white mx-2" onclick="return confirm('Apakah Anda yakin ingin menghapus developer ini?');">
                                <i class="fas fa-trash text-3xl"></i>
                            </a>
                        </div> -->
                    </div>

                    <h3 class="text-lg font-semibold mt-2 text-center"><?= $dev['nama_developer']; ?></h3>
                    <p class="text-sm text-gray-600 text-center"><?= $dev['deskripsi']; ?></p>

                    <!-- Media Sosial -->
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

    <!-- Tombol Tambah Developer -->
    <!-- <div class="flex justify-end mt-10">
        <a href="insertDev.php" class="bg-blue-500 text-white p-4 rounded-full shadow-lg hover:bg-blue-600 transition">
            <i class="fas fa-plus text-xl"></i>
        </a>
    </div> -->
</main>

<?php include __DIR__ . "/layout/footer.php"; ?>
