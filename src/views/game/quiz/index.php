<?php
require_once(__DIR__ . '/../../../core/config.php');
include __DIR__ . '/../../layout/header.php';
?>

<main class="min-h-screen w-full flex items-center justify-center bg-cover bg-center text-white text-center" style="background: url('quiz.jpg') no-repeat center center fixed; background-size: cover;">
<link rel="stylesheet" href="GameHub1/public/css/output.css">
    <div class="bg-gray-300 bg-opacity-60 p-10 rounded-lg shadow-lg max-w-lg w-full flex flex-col items-center">
        <h1 class="text-3xl font-bold text-gray-900">Selamat Datang di Permainan Quiz!</h1>
        <p class="text-lg text-gray-700 mt-4">Uji kemampuanmu dalam berbagai kategori dan lihat sejauh mana pengetahuanmu!</p>
        <div class="mt-6 flex space-x-4">
            <a href="pilihKategori.php" class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-3 rounded-lg text-lg font-semibold">Mulai Quiz</a>
            <a href="../../index.php" class="bg-red-500 hover:bg-red-600 text-white px-6 py-3 rounded-lg text-lg font-semibold">Kembali</a>
        </div>
    </div>
</main>
