let selectedSquare = null;
let currentX = 0, currentY = 0; // posisi kursor di papan (0–7)
let pressed = {};
let backCooldown = false;

function updateCursor() {
  const board = document.getElementById("board");
  if (!board) return;
  
  const squares = board.querySelectorAll(".square");
  squares.forEach(sq => sq.classList.remove("highlight"));
  
  const targetId = `${8 - currentY}${currentX + 1}`;
  const targetSquare = document.getElementById(targetId);
  if (targetSquare) targetSquare.classList.add("highlight");
}

function handleGamepad() {
  const gp = navigator.getGamepads()[0];
  if (!gp) return;

  const threshold = 0.5;

  // Arah horizontal
  if (gp.axes[0] < -threshold && !pressed.left) {
    currentX = Math.max(0, currentX - 1);
    pressed.left = true;
  } else if (gp.axes[0] > threshold && !pressed.right) {
    currentX = Math.min(7, currentX + 1);
    pressed.right = true;
  } else if (Math.abs(gp.axes[0]) < threshold) {
    pressed.left = pressed.right = false;
  }

  // Arah vertikal
  if (gp.axes[1] < -threshold && !pressed.up) {
    currentY = Math.max(0, currentY - 1);
    pressed.up = true;
  } else if (gp.axes[1] > threshold && !pressed.down) {
    currentY = Math.min(7, currentY + 1);
    pressed.down = true;
  } else if (Math.abs(gp.axes[1]) < threshold) {
    pressed.up = pressed.down = false;
  }

  // Tombol A (Logitech) / Cross (PS4)
  if (gp.buttons[0].pressed && !pressed.select) {
    const squareId = `${8 - currentY}${currentX + 1}`;
    const square = document.getElementById(squareId);
    if (square) square.click();
    pressed.select = true;
  } else if (!gp.buttons[0].pressed) {
    pressed.select = false;
  }

  // Tombol B (Logitech) / Circle (PS4)
  if (gp.buttons[1].pressed && !pressed.cancel) {
    clearHighlights();
    pressed.cancel = true;
  } else if (!gp.buttons[1].pressed) {
    pressed.cancel = false;
  }

  // Tombol "Back" (Select untuk Logitech / PS4)
  if (gp.buttons[8]?.pressed && !backCooldown) {
    backCooldown = true;
    console.log("🔙 Kembali ke halaman utama...");
    window.location.href = "/gamehub/src/views/index.php";
    setTimeout(() => (backCooldown = false), 1000); // cooldown 1 detik
  }

  updateCursor();
}

function clearHighlights() {
  document.querySelectorAll(".square").forEach(sq => sq.classList.remove("highlight"));
}

function gameLoop() {
  handleGamepad();
  requestAnimationFrame(gameLoop);
}

window.addEventListener("gamepadconnected", (e) => {
  console.log("🎮 Controller connected:", e.gamepad.id);
  requestAnimationFrame(gameLoop);
});
