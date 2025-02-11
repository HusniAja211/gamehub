<?php
    $title = "Update Developer";
    require_once('../core/config.php');
    include __DIR__ . "/layout/header.php";
    include __DIR__ . "/layout/navbar.php";
    require_once "../function/func.php";

    // Ambil ID developer dari URL (misalnya, 'id' di URL query string)
    $id = isset($_GET['id']) ? $_GET['id'] : null;
    $developer = null;

    // Ambil data developer berdasarkan ID
    if ($id) {
        $stmt = $conn->prepare("SELECT * FROM developer WHERE id_developer = ?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $developer = $result->fetch_assoc();
        $stmt->close();
    }

    if (!$developer) {
        echo "<script>alert('Developer tidak ditemukan'); window.location.href = 'about.php';</script>";
        exit;
    }

    if (isset($_POST['kirim'])) {
        $nama = $_POST['nama_developer'];
        $instagram = $_POST['instagram'];
        $linkedin = $_POST['linkedin'];
        $github = $_POST['github'];
        $deskripsi = $_POST['deskripsi'];

        // Cek jika gambar baru diupload
        if ($_FILES['gambar_developer']['error'] == 0) {
            $gambar = insertGambarDev($conn, $nama);
        } else {
            // Gunakan gambar lama jika tidak ada gambar baru
            $gambar = $developer['gambar_developer'];
        }
        
        // Query update data developer
        $stmt = $conn->prepare("UPDATE developer SET nama_developer = ?, instagram = ?, linkedin = ?, github = ?, deskripsi = ?, gambar_developer = ? WHERE id_developer = ?");
        $stmt->bind_param("ssssssi", $nama, $instagram, $linkedin, $github, $deskripsi, $gambar, $id);
        $stmt->execute();
        
        if ($stmt->affected_rows > 0) {
            echo "<script>alert('Data developer berhasil diperbarui'); window.location.href = 'about.php';</script>";
        } else {
            echo "<script>alert('Data developer gagal diperbarui'); window.location.href = 'about.php';</script>";
        }
        $stmt->close();
    }
?>

<main class="p-8 flex-1 bg-gradient-to-br from-blue-50 to-white min-h-screen">
    <div class="max-w-3xl mx-auto bg-white p-12 rounded-3xl shadow-2xl border border-gray-200">
        <h2 class="text-4xl font-extrabold text-center mb-10 text-blue-800">Update Data Developer</h2>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="grid grid-cols-1 gap-8">
                <div class="flex flex-col items-center">
                    <label class="block font-medium text-gray-800 mb-2">Nama Developer</label>
                    <input type="text" name="nama_developer" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-blue-400 focus:outline-none shadow-md" autocomplete="off" value="<?php echo htmlspecialchars($developer['nama_developer']); ?>" required>

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Instagram</label>
                    <input type="text" name="instagram" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-pink-400 shadow-md" autocomplete="off" value="<?php echo htmlspecialchars($developer['instagram']); ?>">

                    <label class="block font-medium text-gray-800 mt-5 mb-2">LinkedIn</label>
                    <input type="text" name="linkedin" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-blue-500 shadow-md" autocomplete="off" value="<?php echo htmlspecialchars($developer['linkedin']); ?>">

                    <label class="block font-medium text-gray-800 mt-5 mb-2">GitHub</label>
                    <input type="text" name="github" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-gray-500 shadow-md" autocomplete="off" value="<?php echo htmlspecialchars($developer['github']); ?>">

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Deskripsi</label>
                    <input type="text" name="deskripsi" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-gray-500 shadow-md" autocomplete="off" value="<?php echo htmlspecialchars($developer['deskripsi']); ?>" required>

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Upload Image</label>
                    <input type="file" name="gambar_developer" accept="image/*" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-gray-500 shadow-md">
                    
                </div>
            </div>
            <div class="mt-10 text-center">
                <button type="submit" name="kirim" class="bg-gradient-to-r from-green-400 to-green-600 hover:from-green-500 hover:to-green-700 text-white font-bold py-3 px-12 rounded-full transition-transform transform hover:scale-105 shadow-xl">Update Data</button>
            </div>
        </form>
    </div>
</main>

<?php include __DIR__ . "/layout/footer.php"; ?>
