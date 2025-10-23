<?php
require_once(__DIR__ . '/../../../core/config.php');
include __DIR__ . '/../../layout/header.php';
?>

<link rel="stylesheet" href="GameHub1/public/css/output.css">

<main class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 via-white to-blue-100 text-gray-800">
  <div class="bg-white p-10 rounded-2xl shadow-xl max-w-lg w-full text-center border border-blue-100">
    <h1 class="text-4xl font-extrabold text-blue-700 mb-4">💡 Quiz Game</h1>
    <p class="text-lg text-gray-600 mb-8">Uji kemampuanmu dalam berbagai kategori dan dapatkan skor tertinggi!</p>
    <div class="flex flex-col sm:flex-row justify-center gap-4">
      <a href="pilihKategori.php" class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-semibold transition">Mulai Quiz</a>
      <a href="../../index.php" class="px-6 py-3 bg-gray-200 hover:bg-gray-300 text-blue-700 rounded-lg font-semibold transition">Kembali</a>
    </div>
  </div>
</main>
