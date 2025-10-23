// ======================================================
// 🎮 UNIVERSAL CONTROLLER SYSTEM for Web GameHub
// Versi: 2.1 (Non-module, Auto-detect PS4 + Logitech F310 + Dual Action)
// ======================================================

window.GameController = (function () {
  const DEADZONE = 0.25;
  const controllers = {};
  const listeners = { press: {}, release: {}, move: {} };
  let buttonStates = {};

  // ===== Event API =====
  function onPress(button, callback) { listeners.press[button] = callback; }
  function onRelease(button, callback) { listeners.release[button] = callback; }
  function onMove(direction, callback) { listeners.move[direction] = callback; }

  // ===== Gamepad connect/disconnect =====
  window.addEventListener("gamepadconnected", (e) => {
    controllers[e.gamepad.index] = e.gamepad;
    console.log(`🎮 Controller connected: ${e.gamepad.id}`);
    updateLoop();
  });

  window.addEventListener("gamepaddisconnected", (e) => {
    delete controllers[e.gamepad.index];
    console.log(`🔌 Controller disconnected: ${e.gamepad.id}`);
  });

  // ===== Mapping helper =====
  function getButtonName(gamepad, index) {
    const id = gamepad.id.toLowerCase();

    // PS4 Wireless Controller
    if (id.includes("wireless controller")) {
      return [
        "Cross", "Circle", "Square", "Triangle",
        "L1", "R1", "L2", "R2",
        "Share", "Options", "L3", "R3",
        "DPadUp", "DPadDown", "DPadLeft", "DPadRight",
        "PS", "TouchPad"
      ][index] || `Btn${index}`;
    }

    // Logitech F310 / Dual Action / XInput
    if (id.includes("logitech") || id.includes("f310") || id.includes("dual action") || id.includes("xinput")) {
      return [
        "A", "B", "X", "Y",
        "L1", "R1", "L2", "R2",
        "Select", "Start", "L3", "R3",
        "DPadUp", "DPadDown", "DPadLeft", "DPadRight"
      ][index] || `Btn${index}`;
    }

    // Default Xbox Layout
    return [
      "A", "B", "X", "Y",
      "L1", "R1", "L2", "R2",
      "Select", "Start", "L3", "R3",
      "DPadUp", "DPadDown", "DPadLeft", "DPadRight"
    ][index] || `Btn${index}`;
  }

  // ===== Main Loop =====
  function updateLoop() {
    const pads = navigator.getGamepads ? navigator.getGamepads() : [];

    for (const pad of pads) {
      if (!pad) continue;

      // --- Tombol ---
      pad.buttons.forEach((btn, index) => {
        const name = getButtonName(pad, index);
        const pressed = btn.pressed || btn.value > 0.5;

        if (pressed && !buttonStates[name]) {
          buttonStates[name] = true;
          if (listeners.press[name]) listeners.press[name]();
        } else if (!pressed && buttonStates[name]) {
          buttonStates[name] = false;
          if (listeners.release[name]) listeners.release[name]();
        }
      });

      // ===== Analogs (auto-detect mapping) =====
      const id = pad.id.toLowerCase();
      let lx, ly, rx, ry;

      // Logitech & PS4 detection
      if (id.includes("logitech") || id.includes("dual action")) {
        lx = pad.axes[0];
        ly = pad.axes[1];
        rx = pad.axes[2] !== undefined ? pad.axes[2] : pad.axes[4];
        ry = pad.axes[3] !== undefined ? pad.axes[3] : pad.axes[5];
      } else if (id.includes("wireless controller")) {
        lx = pad.axes[0];
        ly = pad.axes[1];
        rx = pad.axes[2];
        ry = pad.axes[3];
      } else {
        lx = pad.axes[0];
        ly = pad.axes[1];
        rx = pad.axes[4];
        ry = pad.axes[5];
      }

      // --- Analog kiri ---
      if (Math.abs(lx) > DEADZONE || Math.abs(ly) > DEADZONE) {
        if (Math.abs(lx) > Math.abs(ly)) {
          if (lx > 0 && listeners.move["LeftStickRight"]) listeners.move["LeftStickRight"]();
          else if (lx < 0 && listeners.move["LeftStickLeft"]) listeners.move["LeftStickLeft"]();
        } else {
          if (ly > 0 && listeners.move["LeftStickDown"]) listeners.move["LeftStickDown"]();
          else if (ly < 0 && listeners.move["LeftStickUp"]) listeners.move["LeftStickUp"]();
        }
      }

      // --- Analog kanan ---
      if (Math.abs(rx) > DEADZONE || Math.abs(ry) > DEADZONE) {
        if (Math.abs(rx) > Math.abs(ry)) {
          if (rx > 0 && listeners.move["RightStickRight"]) listeners.move["RightStickRight"]();
          else if (rx < 0 && listeners.move["RightStickLeft"]) listeners.move["RightStickLeft"]();
        } else {
          if (ry > 0 && listeners.move["RightStickDown"]) listeners.move["RightStickDown"]();
          else if (ry < 0 && listeners.move["RightStickUp"]) listeners.move["RightStickUp"]();
        }
      }

      // --- DPad (kadang sebagai axis) ---
      const dpadX = pad.axes[6] ?? pad.axes[9];
      const dpadY = pad.axes[7] ?? pad.axes[10];

      if (dpadX) {
        if (dpadX > 0.5 && listeners.move["DPadRight"]) listeners.move["DPadRight"]();
        else if (dpadX < -0.5 && listeners.move["DPadLeft"]) listeners.move["DPadLeft"]();
      }
      if (dpadY) {
        if (dpadY > 0.5 && listeners.move["DPadDown"]) listeners.move["DPadDown"]();
        else if (dpadY < -0.5 && listeners.move["DPadUp"]) listeners.move["DPadUp"]();
      }
    }

    requestAnimationFrame(updateLoop);
  }

  // ===== Public API =====
  return { onPress, onRelease, onMove };
})();
