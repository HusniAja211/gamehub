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
    <link rel="stylesheet" href="../../../../public/css/output.css">
    <style>
        .custom-button {
            padding: 10px 25px;
            font-size: 1.1rem;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-success.custom-button:hover {
            background-color: #218838; /* warna hover untuk tombol Play */
            transform: scale(1.05);
        }

        .btn-secondary.custom-button:hover {
            background-color: #545b62; /* warna hover untuk tombol Back */
            transform: scale(1.05);
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body class="bg-gray-100">

<div class="container mx-auto text-center mt-16">
    <h1 class="text-4xl font-bold text-blue-600">Memory Game</h1>
    <p class="text-lg mt-4">Match two cards until three of the same to win!</p>

    <!-- Tombol Play -->
    <a href="main.html" class="inline-block mt-8 px-8 py-3 bg-green-600 text-white font-semibold rounded-lg hover:bg-green-700 transition-all duration-300 transform hover:scale-105">Play</a>

    <!-- Tombol Back -->
    <button class="mt-4 inline-block px-8 py-3 bg-gray-600 text-white font-semibold rounded-lg hover:bg-gray-700 transition-all duration-300 transform hover:scale-105">
        <a href="../../index.php" class="text-white">Back</a>
    </button>
</div>

</body>
</html>