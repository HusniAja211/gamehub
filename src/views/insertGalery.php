<?php
    $title = "Create Developer";
    require_once('../core/config.php');
    include __DIR__ . "/layout/header.php";
    include __DIR__ . "/layout/navbar.php";
    require_once "../function/func.php";

    if (isset($_POST['kirim'])) {
        $nama = $_POST['nama_gambar'];
    

        // Panggil fungsi insertGambar dan dapatkan ID gambar
        $gambar = insertGambarGalery($conn, $nama);
        
        // Sesuaikan query agar kolom gambar_game ikut diisi
        $stmt = $conn->prepare("INSERT INTO galery (nama_galery) VALUES (?)");
        $stmt->bind_param("s", $gambar);        
        $stmt->execute();
        
        if ($stmt->affected_rows > 0) {
            echo "<script>alert('Data berhasil ditambahkan'); window.location.href = 'galery.php';</script>";
        } else {
            echo "<script>alert('Data gagal ditambahkan'); window.location.href = 'galery.php';</script>";
        }
        $stmt->close();
    }


    ?>

    <main class="p-8 flex-1 bg-gradient-to-br from-blue-50 to-white min-h-screen">
    <div class="max-w-3xl mx-auto bg-white p-12 rounded-3xl shadow-2xl border border-gray-200">
        <h2 class="text-4xl font-extrabold text-center mb-10 text-blue-800">Tambah Data Developer</h2>
        <form action="" method="POST" enctype="multipart/form-data">
        <div class="grid grid-cols-1 gap-8">
            <div class="flex flex-col items-center">
            <label class="block font-medium text-gray-800 mb-2">Nama Gambar</label>
            <input type="text" name="nama_gambar" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-blue-400 focus:outline-none shadow-md" autocomplete="off" required>

            <label class="block font-medium text-gray-800 mt-5 mb-2">Upload Image</label>
            <input type="file" name="gambar_galery" accept="image/*" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-gray-500 shadow-md">
            </div>
        </div>
        <div class="mt-10 text-center">
            <button type="submit" name="kirim" class="bg-gradient-to-r from-green-400 to-green-600 hover:from-green-500 hover:to-green-700 text-white font-bold py-3 px-12 rounded-full transition-transform transform hover:scale-105 shadow-xl">Kirim Data</button>
        </div>
        </form>
    </div>
    </main>

    <?php include __DIR__ . "/layout/footer.php"; ?>
