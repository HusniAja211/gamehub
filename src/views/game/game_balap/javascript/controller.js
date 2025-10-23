// controller.js
let controllerConnected = false;
let gamepadIndex = null;

// Deadzone kecil biar stick analog gak gerak sendiri
const DEADZONE = 0.2;

// Deteksi koneksi controller
window.addEventListener("gamepadconnected", (e) => {
  controllerConnected = true;
  gamepadIndex = e.gamepad.index;
  console.log("🎮 Controller connected:", e.gamepad.id);
});

window.addEventListener("gamepaddisconnected", (e) => {
  controllerConnected = false;
  gamepadIndex = null;
  console.log("Controller disconnected");
});

function updateController() {
  if (!controllerConnected) return;

  const gp = navigator.getGamepads()[gamepadIndex];
  if (!gp) return;

  // Reset input
  KEYS.ArrowUp = false;
  KEYS.ArrowDown = false;
  KEYS.ArrowLeft = false;
  KEYS.ArrowRight = false;

  // Akselerasi (Tombol A / Cross / R2)
  if (gp.buttons[0].pressed || gp.buttons[7]?.pressed) KEYS.ArrowUp = true;

  // Rem (Tombol B / Circle / L2)
  if (gp.buttons[1].pressed || gp.buttons[6]?.pressed) KEYS.ArrowDown = true;

  // Start game (tombol Start)
  if (gp.buttons[9].pressed) {
    const evt = new KeyboardEvent("keyup", { code: "KeyC" });
    window.dispatchEvent(evt);
  }

  // Reset game (tombol Select / Back)
  if (gp.buttons[8].pressed) {
    const evt = new KeyboardEvent("keyup", { code: "Escape" });
    window.dispatchEvent(evt);
  }

  // Analog kiri: steer
  const axisX = gp.axes[0]; // kiri/kanan
  if (axisX < -DEADZONE) KEYS.ArrowLeft = true;
  else if (axisX > DEADZONE) KEYS.ArrowRight = true;
}

// Loop untuk baca input controller
function controllerLoop() {
  updateController();
  requestAnimationFrame(controllerLoop);
}
controllerLoop();
