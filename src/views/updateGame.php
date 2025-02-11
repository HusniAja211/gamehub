<?php
require_once('../core/config.php');
include __DIR__ . "/layout/header.php";
include __DIR__ . "/layout/navbar.php";
require_once "../function/func.php";

// Ambil ID game dari URL (misalnya? id_game=1)
$id_game = isset($_GET['id_game']) ? $_GET['id_game'] : null;

// Jika ID game tidak ada, redirect ke halaman daftar game atau tampilkan pesan error
if (!$id_game) {
    echo "<script>alert('ID game tidak valid'); window.location.href = 'daftar_game.php';</script>";
    exit;
}

// Ambil data game berdasarkan ID
$query = "SELECT * FROM game WHERE id_game = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $id_game);
$stmt->execute();
$result = $stmt->get_result();
$game = $result->fetch_assoc();

// Ambil daftar developer dari database
$developers = [];
$query_developer = "SELECT id_tim, nama_anggota FROM tim_developer ORDER BY id_tim ASC";
$result_developer = $conn->query($query_developer);
if ($result_developer) {
    while ($row = $result_developer->fetch_assoc()) {
        $developers[] = $row;
    }
}

if (isset($_POST['kirim'])) {
    $nama = $_POST['nama_game'];
    $developer = $_POST['developer'];
    $deskripsi = $_POST['deskripsi_game'];
    $tautan = $_POST['tautan_game'];
    
    // Cek apakah gambar baru diupload
    if ($_FILES['gambar_game']['name']) {
        // Panggil fungsi insertGambar dan dapatkan ID gambar
        $gambar = insertGambarGame($conn, $nama);
        $gambar_query = ", gambar_game = ?";
    } else {
        // Jika tidak ada gambar baru, gunakan gambar lama
        $gambar = $game['gambar_game'];
        $gambar_query = "";
    }
    
    // Update data game
    $stmt = $conn->prepare("UPDATE game SET nama_game = ?, fid_timDeveloper = ?, tautan = ?, deskripsi = ? $gambar_query WHERE id_game = ?");
    if ($_FILES['gambar_game']['name']) {
        $stmt->bind_param("sisssi", $nama, $developer, $tautan, $deskripsi, $gambar, $id_game);
    } else {
        $stmt->bind_param("sisss", $nama, $developer, $tautan, $deskripsi, $id_game);
    }

    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "<script>alert('Data game berhasil diperbarui'); window.location.href = 'index.php';</script>";
    } else {
        echo "<script>alert('Data game gagal diperbarui');</script>";
    }
    $stmt->close();
}

?>

<main class="p-8 flex-1 bg-gradient-to-br from-blue-50 to-white min-h-screen">
    <div class="max-w-3xl mx-auto bg-white p-12 rounded-3xl shadow-2xl border border-gray-200">
        <h2 class="text-4xl font-extrabold text-center mb-10 text-blue-800">Update Data Game</h2>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="grid grid-cols-1 gap-8">
                <div class="flex flex-col items-center">
                    <label class="block font-medium text-gray-800 mb-2">Nama Game</label>
                    <input type="text" name="nama_game" value="<?= htmlspecialchars($game['nama_game']); ?>" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-blue-400 focus:outline-none shadow-md" autocomplete="off" required>

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Developer</label>
                    <select name="developer" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-pink-400 shadow-md" required>
                        <option value="">Pilih Developer</option>
                        <?php foreach ($developers as $developer): ?>
                            <option value="<?php echo $developer['id_tim']; ?>" <?php if ($game['fid_timDeveloper'] == $developer['id_tim']) echo 'selected'; ?>>
                                <?php echo htmlspecialchars($developer['nama_anggota']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Gambar Game</label>
                    <input type="file" name="gambar_game" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-blue-500 shadow-md">

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Tautan</label>
                    <input type="text" name="tautan_game" value="<?= htmlspecialchars($game['tautan']); ?>" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-gray-500 shadow-md" autocomplete="off" required>    

                    <label class="block font-medium text-gray-800 mt-5 mb-2">Deskripsi</label>
                    <input type="text" name="deskripsi_game" value="<?= htmlspecialchars($game['deskripsi']); ?>" class="w-3/4 p-4 border border-gray-300 rounded-2xl focus:ring-4 focus:ring-gray-500 shadow-md" autocomplete="off" required>

                </div>
            </div>
            <div class="mt-10 text-center">
                <button type="submit" name="kirim" class="bg-gradient-to-r from-green-400 to-green-600 hover:from-green-500 hover:to-green-700 text-white font-bold py-3 px-12 rounded-full transition-transform transform hover:scale-105 shadow-xl">Update Data</button>
            </div>
        </form>
    </div>
</main>

<?php include __DIR__ . "/layout/footer.php"; ?>
