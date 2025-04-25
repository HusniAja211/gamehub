<?php 
// Ambil daftar gambar dari folder images/
$images = glob("images/*.jpg"); 
$cardArray = [];

foreach ($images as $image) {
    $name = pathinfo($image, PATHINFO_FILENAME);
    $cardArray[] = ['name' => $name, 'img' => $image];
}

// Gandakan daftar kartu untuk permainan
$cardArray = array_merge($cardArray, $cardArray);

// Acak posisi kartu
shuffle($cardArray);

// Ubah array PHP menjadi JSON agar bisa dipakai di JavaScript
$cardArrayJSON = json_encode($cardArray);
?>

<!DOCTYPE html>
<html lang="en">
<head>
   
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="container text-center mt-5">
    <h1 class="fw-bold text-primary">Memory Card Game</h1>
    <p class="lead">Cocokkan dua kartu yang sama untuk menang!</p>

    <!-- Tombol Play -->
    <a href="main.html" class="btn btn-success btn-lg mt-3">Play</a>
</div>
<!-- Tombol Back -->
<button onclick="history.back()" class="btn btn-secondary btn-lg mt-3">Back</button>
</div>
<style>.btn-secondary {
    background-color: #6c757d !important;
    color: white !important;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.btn-secondary:hover {
    background-color: #5a6268 !important;
    transform: scale(1.05);
}
</style>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
