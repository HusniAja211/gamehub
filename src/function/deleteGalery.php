<?php
require_once('../core/config.php');

function deleteGalery($conn, $id_galery) {
    $stmt = $conn->prepare("DELETE FROM galery WHERE id_galery= ?");
    $stmt->bind_param("i", $id_galery);
    $stmt->execute();
    $stmt->close();
}

// Cek apakah id_game ada di parameter URL
if (isset($_GET['id_galery'])) {
    $id_galery = (int)$_GET['id_galery'];

    // Panggil fungsi untuk menghapus game berdasarkan id$id_galery
    deleteGalery($conn, $id_galery);

    echo"<script>
    alert('Data Berhasil Dihapus');
    </script>";

    // Redirect setelah penghapusan selesai untuk mencegah reload halaman
    header("Location: ../views/galery.php");  // Arahkan kembali ke halaman utama
    exit();  // Pastikan script tidak lanjut setelah redirect
} else {
    // Jika id_galery tidak ada, tampilkan pesan error atau redirect ke halaman lain
     echo"<script>
    alert('ID Galery tidak ditemukan');
    </script>";
}