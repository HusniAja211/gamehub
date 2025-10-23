// controllerNavigation.js
(() => {
  let gamepadIndex = null;
  let axisThreshold = 0.3; // Minimum movement to register
  let lastDropTime = 0;
  let moveSpeed = 12; // pixels per frame for joystick movement
  const dropCooldown = 400; // ms between drops

  const gpDot = document.getElementById("gp-dot");
  const gpName = document.getElementById("gp-name");

  // --- Detect Gamepad Connection / Disconnection ---
  window.addEventListener("gamepadconnected", (e) => {
    gamepadIndex = e.gamepad.index;
    gpDot.style.background = "#0f0";
    gpName.textContent = e.gamepad.id;
    console.log(`Gamepad connected: ${e.gamepad.id}`);
    updateLoop();
  });

  window.addEventListener("gamepaddisconnected", (e) => {
    if (e.gamepad.index === gamepadIndex) {
      gamepadIndex = null;
      gpDot.style.background = "#f00";
      gpName.textContent = "Not connected";
      console.log("Gamepad disconnected");
    }
  });

  // --- Main Gamepad Update Loop ---
  function updateLoop() {
    if (gamepadIndex === null) return;
    const gp = navigator.getGamepads()[gamepadIndex];
    if (!gp) return;

    // Axes
    const axisX = gp.axes[0]; // Left stick X-axis

    if (Game.stateIndex === GameStates.READY && Game.elements.previewBall) {
      if (axisX < -axisThreshold) {
        Game.elements.previewBall.position.x -= moveSpeed;
      } else if (axisX > axisThreshold) {
        Game.elements.previewBall.position.x += moveSpeed;
      }
      // Limit within screen
      Game.elements.previewBall.position.x = Math.max(48, Math.min(Game.width - 48, Game.elements.previewBall.position.x));
    }

    // Buttons
    const btnA = gp.buttons[0]?.pressed; // A (Cross on PS4)
    const btnB = gp.buttons[1]?.pressed; // B (Circle)
    const btnX = gp.buttons[2]?.pressed; // X (Square)
    const btnY = gp.buttons[3]?.pressed; // Y (Triangle)
    const btnStart = gp.buttons[9]?.pressed; // Start / Options
    const btnBack = gp.buttons[8]?.pressed; // Back / Share

    const now = performance.now();

    // --- Drop fruit (A button) ---
    if (btnA && Game.stateIndex === GameStates.READY && now - lastDropTime > dropCooldown) {
      lastDropTime = now;
      Game.addFruit(Game.elements.previewBall.position.x);
    }

    // --- Restart (Start button) ---
    if (btnStart && Game.stateIndex === GameStates.LOSE) {
      location.reload();
    }

      // --- Kembali ke index.php (Back button) ---
    if (btnBack) {
      console.log("Returning to index.php...");
      window.location.href = "/gamehub/src/views/index.php";
    }

    // --- Optional debug or cancel (B) ---
    if (btnB) {
      console.log("Cancel pressed");
    }

    requestAnimationFrame(updateLoop);
  }
})();
