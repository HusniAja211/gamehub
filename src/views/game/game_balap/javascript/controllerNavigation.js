// ------------------------------------------------------------
// Gamepad Controller Integration for gamehub
// ------------------------------------------------------------

let activeGamepadIndex = null;
let gamepadConnected = false;

// Simulasi input keyboard
function setKey(code, state) {
  if (typeof KEYS !== "undefined") {
    KEYS[code] = state;
  }
}

// Ketika gamepad terhubung
window.addEventListener("gamepadconnected", (e) => {
  activeGamepadIndex = e.gamepad.index;
  gamepadConnected = true;
  console.log(`🎮 Gamepad connected: ${e.gamepad.id}`);
  pollGamepad();
});

// Ketika dicabut
window.addEventListener("gamepaddisconnected", () => {
  console.log("❌ Gamepad disconnected");
  gamepadConnected = false;
  activeGamepadIndex = null;
});

// Loop pembacaan input
function pollGamepad() {
  if (!gamepadConnected) return;

  const gp = navigator.getGamepads()[activeGamepadIndex];
  if (!gp) return;

  // ---------------------------------
  // Analog kiri (arah)
  // ---------------------------------
  const lx = gp.axes[0]; // kiri-kanan
  const ly = gp.axes[1]; // atas-bawah

  setKey("ArrowLeft", lx < -0.3);
  setKey("ArrowRight", lx > 0.3);
  setKey("ArrowUp", ly < -0.3);
  setKey("ArrowDown", ly > 0.3);

  // ---------------------------------
  // Tombol (sesuai layout Xbox)
  // ---------------------------------
  const buttons = gp.buttons;

  // Tombol A (index 0) = Gas
  setKey("ArrowUp", buttons[0].pressed);

  // Tombol B (index 1) = Rem
  setKey("ArrowDown", buttons[1].pressed);

  // Tombol X (index 2) = Belok kiri (opsional)
  if (buttons[2].pressed) setKey("ArrowLeft", true);
  else if (!buttons[2].pressed && lx >= -0.3) setKey("ArrowLeft", false);

  // Tombol Y (index 3) = Belok kanan (opsional)
  if (buttons[3].pressed) setKey("ArrowRight", true);
  else if (!buttons[3].pressed && lx <= 0.3) setKey("ArrowRight", false);

  // Tombol START (index 9)
  if (buttons[9].pressed) {
    const event = new KeyboardEvent("keyup", { code: "KeyC" }); // Mulai game
    window.dispatchEvent(event);
  }

  // Tombol Back (index 9)
  let backCooldown = false;

  if (buttons[8]?.pressed && !backCooldown) {
    // console.log("▶️ Back pressed");
      backCooldown = true;
      window.location.href = "/gamehub/src/views/index.php";
      setTimeout(() => backCooldown = false, 1000); // 1 detik cooldown
  }

  //   gp.buttons.forEach((btn, index) => {
  //   if (btn.pressed) {
  //     console.log(`Button ${index} pressed`);
  //   }
  // });


  // Jalankan loop lagi
  requestAnimationFrame(pollGamepad);
}

console.log("✅ controllerGamepad.js loaded");
