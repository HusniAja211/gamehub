<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Doom Bubbles</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>

<style>
    @charset "UTF-8";

    :root {
        --bs-gradient: linear-gradient(180deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0));
        --bs-body-font-family: Nunito, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;
    }

    .display-1 {
        font-size: calc(1.625rem + 4.5vw);
        font-weight: 300;
        line-height: 1.2;
    }

    @media (min-width: 1200px) {
        .display-1 {
            font-size: 5rem;
        }
    }

    .display-2 {
        font-size: calc(1.575rem + 3.9vw);
        font-weight: 300;
        line-height: 1.2;
    }

    @media (min-width: 1200px) {
        .display-2 {
            font-size: 4.5rem;
        }
    }

    .display-3 {
        font-size: calc(1.525rem + 3.3vw);
        font-weight: 300;
        line-height: 1.2;
    }

    @media (min-width: 1200px) {
        .display-3 {
            font-size: 4rem;
        }
    }

    .display-4 {
        font-size: calc(1.475rem + 2.7vw);
        font-weight: 300;
        line-height: 1.2;
    }

    @media (min-width: 1200px) {
        .display-4 {
            font-size: 3.5rem;
        }
    }

    .display-5 {
        font-size: calc(1.425rem + 2.1vw);
        font-weight: 300;
        line-height: 1.2;
    }

    @media (min-width: 1200px) {
        .display-5 {
            font-size: 3rem;
        }
    }

    .display-6 {
        font-size: calc(1.375rem + 1.5vw);
        font-weight: 300;
        line-height: 1.2;
    }

    @media (min-width: 1200px) {
        .display-6 {
            font-size: 2.5rem;
        }
    }

    /* Container media queries */
    @media (min-width: 576px) {
        .container-sm,
        .container {
            max-width: 540px;
        }
    }

    @media (min-width: 768px) {
        .container-md,
        .container-sm,
        .container {
            max-width: 720px;
        }
    }

    @media (min-width: 992px) {
        .container-lg,
        .container-md,
        .container-sm,
        .container {
            max-width: 960px;
        }
    }

    @media (min-width: 1200px) {
        .container-xl,
        .container-lg,
        .container-md,
        .container-sm,
        .container {
            max-width: 1140px;
        }
    }

    @media (min-width: 1400px) {
        .container-xxl,
        .container-xl,
        .container-lg,
        .container-md,
        .container-sm,
        .container {
            max-width: 1320px;
        }
    }

    /* Button customization */
    .btn-primary {
        --bs-btn-bg: rgb(17, 3, 32);
        --bs-btn-border-color: hsl(283, 85.30%, 13.30%);
        --bs-btn-hover-bg: rgb(102, 36, 160);
    }

    /* Navbar styles */
    #mainNav .navbar-brand {
        color: #000;
        font-weight: 700;
        padding: 0.9rem 0;
    }

    @media (min-width: 992px) {
        #mainNav {
            padding-top: 0;
            padding-bottom: 0;
            border-bottom: none;
            background-color: transparent;
            transition: background-color 0.3s ease-in-out;
        }
    }

    /* Button styles */
    .btn {
        box-shadow: 0 0.1875rem 0.1875rem 0 rgba(0, 0, 0, 0.1) !important;
        padding: 1.25rem 2rem;
        font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        font-size: 80%;
        text-transform: uppercase;
        letter-spacing: 0.15rem;
        border: 0;
    }

    /* Masthead styles */
    .masthead {
        position: relative;
        width: 100%;
        height: auto;
        min-height: 35rem;
        padding: 15rem 0;
        background: linear-gradient(to bottom, rgb(0, 0, 0) 0%, rgb(27, 5, 81) 75%, #000 100%), url("../assets/img/bg-masthead.jpg");
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: scroll;
        background-size: cover;
    }

    .masthead h1,
    .masthead .h1 {
        font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        font-size: 2.5rem;
        line-height: 2.5rem;
        letter-spacing: 0.8rem;
        background: linear-gradient(rgb(248, 247, 247), rgb(82, 2, 83));
        -webkit-text-fill-color: transparent;
        -webkit-background-clip: text;
        background-clip: text;
    }

    .masthead h2,
    .masthead .h2 {
        max-width: 20rem;
        font-size: 1rem;
    }

    @media (min-width: 768px) {
        .masthead h1,
        .masthead .h1 {
            font-size: 4rem;
            line-height: 4rem;
        }
    }

    @media (min-width: 992px) {
        .masthead {
            height: 100vh;
            padding: 0;
        }

        .masthead h1,
        .masthead .h1 {
            font-size: 6.5rem;
            line-height: 6.5rem;
            letter-spacing: 0.8rem;
        }

        .masthead h2,
        .masthead .h2 {
            max-width: 30rem;
            font-size: 1.25rem;
        }
    }

    /* Fixed navbar */
    .fixed-top {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        z-index: 1030;
    }

    @media (min-width: 992px) {
        .px-lg-4 {
            padding-right: 1.5rem !important;
            padding-left: 1.5rem !important;
        }

        .px-lg-5 {
            padding-right: 3rem !important;
            padding-left: 3rem !important;
        }
    }

    /* Styling for loading screen */
    #loadingScreen {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.8);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        font-size: 2rem;
        display: none;
    }

    .pacman {
        width: 50px;
        height: 50px;
        background-color: yellow;
        border-radius: 50%;
        position: relative;
        clip-path: polygon(100% 50%, 50% 0, 50% 50%, 50% 100%, 100% 50%);
        animation: movePacman 2s linear infinite alternate, openCloseMouth 0.3s infinite alternate;
    }

    @keyframes movePacman {
        0% {
            transform: translateX(-50px);
        }

        100% {
            transform: translateX(50px);
        }
    }

    @keyframes openCloseMouth {
        0% {
            clip-path: polygon(100% 50%, 50% 0, 50% 50%, 50% 100%, 100% 50%);
        }

        100% {
            clip-path: polygon(100% 50%, 50% 10%, 50% 50%, 50% 90%, 100% 50%);
        }
    }

    a{
      text-decoration: none;
    }
</style>

<body id="page-top">

    <!-- Masthead-->
    <header class="masthead">
        <div class="container d-flex h-100 align-items-center justify-content-center">
            <div class="text-center">
                <h1 style="font-family: Marker Felt, fantasy;" class="text-uppercase">Doom</h1>
                <h1 style="font-family: Marker Felt, fantasy;" class="text-uppercase">Bubbles</h1>
                <button class="btn btn-primary" onclick="startGame()">Play Game</button>
                <button class="btn btn-primary"><a href="../../index.php">Back</a></button>
            </div>
        </div>
    </header>

    <!-- Loading screen -->
    <div id="loadingScreen">
        <div class="pacman"></div>
        <p>Loading...</p>
    </div>

    <script>
        function startGame() {
            document.getElementById("loadingScreen").style.display = "flex";
            setTimeout(() => {
                window.location.href = "game.html";
            }, 5000); // Delay 3 seconds before redirecting
        }
    </script>

     <script src="/gamehub/src/function/controller.js"></script>
    <script src="js/controllerNavigation.js"></script>

</body>

</html>
