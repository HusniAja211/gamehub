// ------------------------------------------------------------
// Gamepad Support for Brick Breaker
// ------------------------------------------------------------

let activeGamepadIndex = null;
let gamepadConnected = false;
let backCooldown = false; // ✅ Tambahkan variabel ini di luar fungsi

// Event saat controller tersambung
window.addEventListener("gamepadconnected", (e) => {
  activeGamepadIndex = e.gamepad.index;
  gamepadConnected = true;
  console.log(`🎮 Gamepad connected: ${e.gamepad.id}`);
  pollGamepad();
});

// Event saat controller dicabut
window.addEventListener("gamepaddisconnected", () => {
  console.log("❌ Gamepad disconnected");
  gamepadConnected = false;
  activeGamepadIndex = null;
});

// Fungsi utama pembacaan input
function pollGamepad() {
  if (!gamepadConnected) return;

  const gp = navigator.getGamepads()[activeGamepadIndex];
  if (!gp) return;

  const buttons = gp.buttons; // ✅ Inilah baris penting yang hilang

  // ---- ANALOG KIRI (Gerak paddle kiri-kanan) ----
  const lx = gp.axes[0];
  if (lx < -0.3) {
    leftPressed = true;
    rightPressed = false;
  } else if (lx > 0.3) {
    rightPressed = true;
    leftPressed = false;
  } else {
    leftPressed = false;
    rightPressed = false;
  }

  // ---- Tombol A (index 0) untuk "Start" / Gas ----
  if (buttons[0].pressed) {
    // Bisa tambahkan efek nanti kalau mau
  }

  // ---- Tombol B (index 1) untuk "Pause" ----
  if (buttons[1].pressed) {
    // Optional: tambahkan logika pause
  }

  // ---- Tombol Start (index 9) untuk Restart ----
  if (buttons[9].pressed) {
    console.log("🔁 Restarting game...");
    gameOver = false;
    const overlay = document.getElementById("gameOverScreen");
    if (overlay) overlay.classList.add("hidden");
    document.location.reload();
  }

  // ---- Tombol Back (index 8) untuk kembali ke menu ----
  if (buttons[8]?.pressed && !backCooldown) {
    backCooldown = true;
    window.location.href = "/gamehub/src/views/index.php";
    setTimeout(() => (backCooldown = false), 1000); // cooldown 1 detik
  }

  // Jalankan loop setiap frame
  requestAnimationFrame(pollGamepad);
}

console.log("✅ controllerIntegration.js loaded");
