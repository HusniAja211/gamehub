// ============================
// 🎮 CONTROLLER NAVIGATION UNTUK GAME
// ============================

// Variabel global
let cursorIndex = 0;
let pressed = {};
let gamepadConnected = false;

// Fungsi: update highlight visual
function updateCursorHighlight() {
  const cards = document.querySelectorAll('.card');
  if (!cards.length) return;

  cards.forEach((card, i) => {
    if (i === cursorIndex) {
      card.style.outline = "4px solid #3b82f6";
      card.style.boxShadow = "0 0 15px rgba(59,130,246,0.7)";
      card.style.transform = "scale(1.1)";
      card.style.zIndex = "5";
      card.style.transition = "all 0.15s ease";
    } else {
      card.style.outline = "none";
      card.style.boxShadow = "none";
      card.style.transform = "scale(1)";
      card.style.zIndex = "1";
    }
  });
}

// Fungsi: logika input controller
function handleGamepad() {
  const gp = navigator.getGamepads()[0];
  if (!gp) return;

  const threshold = 0.5;
  const cards = document.querySelectorAll('.card');
  if (!cards.length) return;

  const gridCols = Math.ceil(Math.sqrt(cards.length)); // asumsi papan persegi

  // --- Navigasi Horizontal ---
  if (gp.axes[0] < -threshold && !pressed.left) {
    cursorIndex = (cursorIndex - 1 + cards.length) % cards.length;
    pressed.left = true;
  } else if (gp.axes[0] > threshold && !pressed.right) {
    cursorIndex = (cursorIndex + 1) % cards.length;
    pressed.right = true;
  } else if (Math.abs(gp.axes[0]) < threshold) {
    pressed.left = pressed.right = false;
  }

  // --- Navigasi Vertikal ---
  if (gp.axes[1] < -threshold && !pressed.up) {
    cursorIndex = (cursorIndex - gridCols + cards.length) % cards.length;
    pressed.up = true;
  } else if (gp.axes[1] > threshold && !pressed.down) {
    cursorIndex = (cursorIndex + gridCols) % cards.length;
    pressed.down = true;
  } else if (Math.abs(gp.axes[1]) < threshold) {
    pressed.up = pressed.down = false;
  }

  // --- Tombol A / X → Flip kartu ---
  if (gp.buttons[0].pressed && !pressed.a) {
    cards[cursorIndex].click();
    pressed.a = true;
  } else if (!gp.buttons[0].pressed) pressed.a = false;

  // --- Tombol B / O → Batalkan seleksi (reset klik) ---
  if (gp.buttons[1].pressed && !pressed.b) {
    if (window.resetSelection) window.resetSelection(); // jika ada fungsi resetSelection di app.js
    pressed.b = true;
  } else if (!gp.buttons[1].pressed) pressed.b = false;

  // --- Tombol Start (OPTIONS) → Restart game ---
  if (gp.buttons[9]?.pressed && !pressed.start) {
    if (window.resetGame) window.resetGame();
    pressed.start = true;
  } else if (!gp.buttons[9]?.pressed) pressed.start = false;

  // --- Tombol Back (SHARE) → Kembali ke menu ---
  if (gp.buttons[8]?.pressed && !pressed.back) {
    window.location.href = "/gamehub/src/views/index.php";
    pressed.back = true;
  } else if (!gp.buttons[8]?.pressed) pressed.back = false;

  updateCursorHighlight();
}

// Loop utama controller
function gamepadLoop() {
  handleGamepad();
  requestAnimationFrame(gamepadLoop);
}

// Event listener
window.addEventListener("gamepadconnected", (e) => {
  console.log("🎮 Controller connected:", e.gamepad.id);
  gamepadConnected = true;
  cursorIndex = 0;
  updateCursorHighlight();
  requestAnimationFrame(gamepadLoop);
});

window.addEventListener("gamepaddisconnected", (e) => {
  console.log("Controller disconnected:", e.gamepad.id);
  gamepadConnected = false;
});

// Optional: panggil manual jika controller sudah tersambung sebelum event muncul
window.addEventListener("load", () => {
  if (navigator.getGamepads()[0]) {
    gamepadConnected = true;
    updateCursorHighlight();
    requestAnimationFrame(gamepadLoop);
  }
});
