<?php
require_once('../core/config.php');

function deleteGalery($conn, $id_developer) {
    $stmt = $conn->prepare("DELETE FROM developer WHERE id_developer= ?");
    $stmt->bind_param("i", $id_developer);
    $stmt->execute();
    $stmt->close();
}

// Cek apakah id_game ada di parameter URL
if (isset($_GET['id_developer'])) {
    $id_developer = (int)$_GET['id_developer'];

    // Panggil fungsi untuk menghapus game berdasarkan id$id_developer
    deleteGalery($conn, $id_developer);

    echo"<script>
    alert('Data Berhasil Dihapus');
    </script>";

    // Redirect setelah penghapusan selesai untuk mencegah reload halaman
    header("Location: ../views/about.php");  // Arahkan kembali ke halaman utama
    exit();  // Pastikan script tidak lanjut setelah redirect
} else {
    // Jika id_developer tidak ada, tampilkan pesan error atau redirect ke halaman lain
     echo"<script>
    alert('ID Developer tidak ditemukan');
    </script>";
}