<?php include __DIR__ . '/../../layout/header.php'; ?>
<main class="bg-[#f49dff] flex items-center justify-center">
    <div class="container w-full max-w-2xl h-full relative flex flex-col justify-center items-center">
        <!-- Tombol Kembali -->
        <a href="../../index.php" class="nav-button fixed top-10 left-10 bg-purple-500 text-purple-100 px-4 py-2 text-lg font-semibold rounded-lg shadow-lg hover:bg-purple-600 transition-all">Kembali</a>
        
        <div id="game-canvas" class="relative w-full h-full flex items-center justify-center">
            <!-- Game UI -->
            <div id="game-ui" class="absolute w-full h-full pointer-events-none select-none font-bold hidden transform-origin-top-left">
                <!-- Skor -->
                <p id="game-score" class="absolute w-full border-b-2 border-dotted text-6xl font-extrabold pl-4 text-purple-300 drop-shadow-md">0</p>

                <!-- Game Over -->
                <div id="game-end-container" class="absolute w-full h-full flex items-center justify-center bg-black bg-opacity-50">
                    <div id="game-end" class="bg-purple-200 p-8 border-4 border-purple-500 shadow-xl rounded-xl pointer-events-auto">
                        <div id="game-end-title" class="font-bold text-4xl text-purple-800">Game Over!</div>
                        <a id="game-end-link" href="" class="inline-block text-white text-xl bg-purple-400 mt-4 py-4 px-8 rounded-lg shadow-md hover:bg-purple-500">Coba Lagi</a>
                    </div>
                </div>

                <!-- Game Status -->
                <div id="game-status" class="absolute left-0 right-0 bottom-0 h-12 bg-purple-200 flex items-center">
                    <div class="game-status-item flex items-center mr-8">
                        <div class="game-status-label text-gray-600 text-lg ml-6 mr-2">Highscore</div>
                        <div id="game-highscore-value" class="text-gray-800 font-bold text-2xl">0</div>
                    </div>
                    <div class="game-status-item flex items-center">
                        <div class="game-status-label text-gray-600 text-lg ml-6 mr-2">Next</div>
                        <img id="game-next-fruit" src="./assets/img/circle0.png" class="w-6 h-6" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="./matter.js"></script>
    <script type="text/javascript" src="./index.js?v=4"></script>
</main>
<?php include __DIR__ . '/../../layout/footer.php'; ?>
