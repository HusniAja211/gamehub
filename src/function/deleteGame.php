<?php
require_once('../core/config.php');

function deletegGame($conn, $id_game) {
    $stmt = $conn->prepare("DELETE FROM game WHERE id_game = ?");
    $stmt->bind_param("i", $id_game);
    $stmt->execute();
    $stmt->close();
}

// Cek apakah id_game ada di parameter URL
if (isset($_GET['id_game'])) {
    $id_game = (int)$_GET['id_game'];

    // Panggil fungsi untuk menghapus game berdasarkan id_game
    deletegGame($conn, $id_game);

    echo"<script>
    alert('Data Berhasil Dihapus');
    </script>";

    // Redirect setelah penghapusan selesai untuk mencegah reload halaman
    header("Location: ../views/index.php");  // Arahkan kembali ke halaman abouy
    exit();  // Pastikan script tidak lanjut setelah redirect
} else {
    // Jika id_game tidak ada, tampilkan pesan error atau redirect ke halaman lain
    echo"<script>
    alert('ID Game tidak ditemukan');
    </script>";
}