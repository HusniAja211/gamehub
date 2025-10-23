/**
 * controllerNavigation.js
 * Dukungan controller untuk navigasi antar halaman dan game Pac-Man.
 * Kompatibel dengan Logitech F310, PS4 Wireless Controller, Xbox Controller.
 */

// ====== VARIABEL DASAR ======
let connectedGamepad = null;
let lastPressTime = 0;
const pressDelay = 200; // ms (hindari input dobel cepat)
let backCooldown = false;

// ====== EVENT DETEKSI GAMEPAD ======
window.addEventListener("gamepadconnected", (e) => {
  console.log("🎮 Controller connected:", e.gamepad.id);
  connectedGamepad = e.gamepad.index;
});

window.addEventListener("gamepaddisconnected", () => {
  console.log("❌ Controller disconnected");
  connectedGamepad = null;
});

// ====== UTILITY: CEK HALAMAN SAAT INI ======
function currentPage() {
  const path = window.location.pathname.toLowerCase();
  if (path.includes("index.php")) return "menu";
  if (path.includes("game.html")) return "game";
  return "other";
}

// ====== LOOP UTAMA GAMEPAD ======
function gamepadLoop() {
  if (connectedGamepad !== null) {
    const gp = navigator.getGamepads()[connectedGamepad];
    if (gp) handleGamepadInput(gp);
  }
  requestAnimationFrame(gamepadLoop);
}

// ====== LOGIKA KONTROL ======
function handleGamepadInput(gp) {
  const now = Date.now();
  if (now - lastPressTime < pressDelay) return;

  const page = currentPage();

  // Tombol utama
  const startPressed = gp.buttons[9]?.pressed;   // Start / Options
  const selectPressed = gp.buttons[8]?.pressed;  // Back / Share
  const up = gp.buttons[12]?.pressed;
  const down = gp.buttons[13]?.pressed;
  const left = gp.buttons[14]?.pressed;
  const right = gp.buttons[15]?.pressed;

  // Analog kiri
  const axisX = gp.axes[0];
  const axisY = gp.axes[1];
  const deadZone = 0.3;

  // === LOGIKA UNTUK HALAMAN MENU ===
  if (page === "menu") {
    if (startPressed) {
      lastPressTime = now;
      console.log("▶️ Start game via controller");
      if (typeof startGame === "function") startGame();
    }

    if (selectPressed && !backCooldown) {
      lastPressTime = now;
      backCooldown = true;
      console.log("⬅️ Back via controller");
      window.location.href = "/gamehub/src/views/index.php";
      setTimeout(() => (backCooldown = false), 1000);
    }
  }

  // === LOGIKA UNTUK GAME PAC-MAN ===
  else if (page === "game") {
    if (typeof player !== "undefined") {
      let newDx = 0, newDy = 0;

      // D-Pad arah
      if (up) newDy = -tileSize;
      else if (down) newDy = tileSize;
      else if (left) newDx = -tileSize;
      else if (right) newDx = tileSize;

      // Analog kiri
      if (axisX < -deadZone) newDx = -tileSize;
      else if (axisX > deadZone) newDx = tileSize;
      if (axisY < -deadZone) newDy = -tileSize;
      else if (axisY > deadZone) newDy = tileSize;

      // Gerak hanya jika tidak menabrak dinding
      if (newDx !== 0 || newDy !== 0) {
        lastPressTime = now;
        if (!isWall(player.x + newDx, player.y + newDy)) {
          player.setDirection(newDx, newDy);
          player.dx = newDx;
          player.dy = newDy;
        }
      }
    }

    // Tombol START = Pause / Resume
    if (startPressed) {
      lastPressTime = now;
      console.log("⏸️ Toggle Pause");
      togglePause();
    }

    // Tombol BACK = Quit ke index.php
    if (selectPressed && !backCooldown) {
      lastPressTime = now;
      backCooldown = true;
      console.log("🏁 Quit game");
      window.location.href = "/gamehub/src/views/index.php";
      setTimeout(() => (backCooldown = false), 1000);
    }
  }
}

// ====== PAUSE / RESUME SYSTEM UNTUK GAME ======
let paused = false;
let gameLoopId = null; // pastikan variabel ini global

function togglePause() {
  paused = !paused;
  if (paused) {
    console.log("Game paused");
    cancelAnimationFrame(gameLoopId);
  } else {
    console.log("Game resumed");
    if (typeof gameLoop === "function") gameLoop();
  }
}

// ====== JALANKAN POLLING ======
gamepadLoop();
