<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loading</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: black;
            overflow: hidden;
        }
        .loading-container {
            display: flex;
            align-items: center;
            position: relative;
        }
        .pacman {
            width: 40px;
            height: 40px;
            background: yellow;
            border-radius: 50%;
            position: relative;
            clip-path: polygon(0% 0%, 100% 50%, 0% 100%, 25% 50%);
            animation: chomp 0.5s infinite alternate;
        }
        @keyframes chomp {
            0% { clip-path: polygon(0% 0%, 100% 50%, 0% 100%, 25% 50%); }
            100% { clip-path: polygon(0% 25%, 100% 50%, 0% 75%, 25% 50%); }
        }
        .dots {
            display: flex;
            gap: 10px;
            margin-left: 10px;
        }
        .dot {
            width: 10px;
            height: 10px;
            background-color: white;
            border-radius: 50%;
            animation: moveDots 1s linear infinite;
        }
        @keyframes moveDots {
            0% { opacity: 1; transform: translateX(0); }
            100% { opacity: 0; transform: translateX(-50px); }
        }
        .loading-text {
            position: absolute;
            bottom: -30px;
            width: 100%;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
            font-size: 20px;
        }
    </style>
</head>
<script>
    
<body>
    <div class="loading-container">
        <div class="pacman"></div>
        <div class="dots">
            <div class="dot" style="animation-delay: 0s;"></div>
            <div class="dot" style="animation-delay: 0.2s;"></div>
            <div class="dot" style="animation-delay: 0.4s;"></div>
        </div>
        <div class="loading-text">Level2...</div>
    </div>
</body>
</html>
