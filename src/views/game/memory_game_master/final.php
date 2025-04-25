<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Over</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">
    <h1>Congratulations!</h1>
    <p>You have successfully completed the game.</p>
    <button id="restartBtn" onclick="restartGame()">Play Again</button>
</div>

<script>
    function restartGame() {
        window.location.href = "index.html"; // Ubah ke halaman utama game
    }
</script>

</body>
</html>

<style>
.container {
    background: rgba(255, 255, 255, 0.2);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

h1 {
    font-size: 2.5rem;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

p {
    font-size: 1.2rem;
}

#restartBtn {
    padding: 10px 20px;
    font-size: 1rem;
    border-radius: 5px;
    border: none;
    background: #ff4b5c;
    color: white;
    cursor: pointer;
    transition: background 0.3s;
}

#restartBtn:hover {
    background: #ff1e3c;
}
</style>
</body>
</html>