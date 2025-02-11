<?php
require_once('../core/config.php');
include __DIR__ . "/layout/header.php";
include __DIR__ . "/layout/navbar.php";
require_once "../function/func.php";

// Get game ID from GET parameter
$id_game = isset($_GET['id_game']) ? (int)$_GET['id_game'] : 0;

// Fetch basic game details and image based on ID
$hasilGame = getGameBasicDetailsById($conn, $id_game);

//Func untuk get developer

?>

<main class="p-6 flex-1 bg-gray-200">
  <div class="container mx-auto bg-gray-200 shadow-xl rounded-lg h-screen grid grid-rows-[60%_40%]">
    <!-- Top Section -->
    <div class="grid grid-cols-2 gap-4">
      <!-- Top Left: Game Preview -->
      <div class="bg-gray-100 rounded-lg flex items-center justify-center relative">
      <div class="w-full h-full bg-gray-300 rounded-lg flex items-center justify-center">
      <?php if (!empty($hasilGame['gambar_path'])): ?>
        <img src="<?= $hasilGame['gambar_path'] ?>" alt="Game Image" class="rounded-lg w-full h-full object-cover">
    <?php else: ?>
        <p class="font-bold text-lg text-gray-700">No Image Available</p>
    <?php endif; ?>
</div>
      </div>

      <!-- Top Right: Game Name and Play Button -->
      <div class="bg-gray-200 rounded-lg flex flex-col justify-center items-center p-4">
        <div class="text-center font-bold text-xl mb-4 text-gray-800">
          <?php echo !empty($hasilGame['nama_game']) ? $hasilGame['nama_game'] : "GAME NAME"; ?>
        </div>
        <a href="<?= $hasilGame['tautan'] ?>"><button class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-6 rounded-lg shadow-md">PLAY</button></a>
      </div>
    </div>

    <!-- Bottom Section -->
    <div class="grid grid-cols-2 gap-4">

    <!-- Bottom Left: Game Dev -->
    <div class="bg-gray-300 p-4 rounded-lg flex flex-col justify-center items-center text-gray-700 font-medium">
      <h1 class="text-lg font-bold">Developer Game</h1>
      <p class="mt-2"><?= htmlspecialchars($hasilGame['nama_anggota']) ?></p>
    </div>

      <!-- Bottom Right: Game Description/Rules -->
      <div class="bg-gray-300 p-4 rounded-lg flex flex-col items-center justify-center text-center text-gray-700 font-medium">
    <h1 class="text-lg font-bold mb-2">Deskripsi Game</h1> <!-- Menambahkan margin-bottom -->
    <p><?php echo !empty($hasilGame['deskripsi']) ? $hasilGame['deskripsi'] : "GAME DESCRIPTION/RULES"; ?></p>
      </div>


    </div>
  </div>
</main>

<?php include __DIR__ . "/layout/footer.php"; ?>
