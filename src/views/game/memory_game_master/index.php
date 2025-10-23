<?php 
$images = glob("images/*.jpg"); 
$cardArray = [];

foreach ($images as $image) {
    $name = pathinfo($image, PATHINFO_FILENAME);
    $cardArray[] = ['name' => $name, 'img' => $image];
}

$cardArray = array_merge($cardArray, $cardArray);
shuffle($cardArray);
$cardArrayJSON = json_encode($cardArray);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="../../../../public/css/output.css">
  <style>
    a { text-decoration: none; }

    .menu a {
      padding: 12px 32px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 8px;
      transition: all 0.3s ease;
    }

    .menu a.active {
      outline: 4px solid #3b82f6;
      transform: scale(1.1);
      box-shadow: 0 0 15px rgba(59,130,246,0.7);
    }

    .menu a.play {
      background-color: #16a34a;
      color: white;
    }

    .menu a.back {
      background-color: #4b5563;
      color: white;
    }

    body { background-color: #f3f4f6; }
  </style>
</head>
<body class="text-center mt-16">

  <h1 class="text-4xl font-bold text-blue-600">Memory Game</h1>
  <p class="text-lg mt-4">Match two cards until three of the same to win!</p>

  <div class="menu flex flex-row justify-center gap-6 mt-8">
    <a href="main.html" class="play">Play</a>
    <a href="../../index.php" class="back">Back</a>
  </div>

  <script src="/gamehub/src/function/controller.js"></script>
  <script src="controllerNavigation.js"></script>

  <script>
  let menuIndex = 0;
  let menuPressed = {};

  function updateMenuFocus() {
    const buttons = document.querySelectorAll(".menu a");
    buttons.forEach((btn, i) => {
      if (i === menuIndex) btn.classList.add("active");
      else btn.classList.remove("active");
    });
  }

  function handleMenuGamepad() {
    const gp = navigator.getGamepads()[0];
    if (!gp) return;

    const threshold = 0.5;
    const buttons = document.querySelectorAll(".menu a");
    if (!buttons.length) return;

    // Navigasi horizontal (kiri-kanan)
    if (gp.axes[0] < -threshold && !menuPressed.left) {
      menuIndex = (menuIndex - 1 + buttons.length) % buttons.length;
      menuPressed.left = true;
    } else if (gp.axes[0] > threshold && !menuPressed.right) {
      menuIndex = (menuIndex + 1) % buttons.length;
      menuPressed.right = true;
    } else if (Math.abs(gp.axes[0]) < threshold) {
      menuPressed.left = menuPressed.right = false;
    }

    // Tombol A / Cross → klik tombol terfokus
    if (gp.buttons[0].pressed && !menuPressed.a) {
      buttons[menuIndex].click();
      menuPressed.a = true;
    } else if (!gp.buttons[0].pressed) menuPressed.a = false;

    // Tombol Back → kembali ke halaman sebelumnya
    if (gp.buttons[8]?.pressed && !menuPressed.back) {
      window.history.back();
      menuPressed.back = true;
    } else if (!gp.buttons[8]?.pressed) menuPressed.back = false;

    updateMenuFocus();
  }

  function gamepadMenuLoop() {
    handleMenuGamepad();
    requestAnimationFrame(gamepadMenuLoop);
  }

  // Saat controller tersambung
  window.addEventListener("gamepadconnected", (e) => {
    console.log("🎮 Controller connected:", e.gamepad.id);
    updateMenuFocus();
    setTimeout(() => requestAnimationFrame(gamepadMenuLoop), 300);
  });

  // Inisialisasi awal (kalau controller sudah tersambung sebelum reload)
  window.addEventListener("load", () => {
    setTimeout(() => {
      if (navigator.getGamepads()[0]) {
        updateMenuFocus();
        requestAnimationFrame(gamepadMenuLoop);
      }
    }, 500);
  });
  </script>
</body>
</html>
