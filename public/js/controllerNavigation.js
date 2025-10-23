// ======================================================
// 🎮 GAME CARD NAVIGATION SYSTEM (for GameHub)
// ======================================================

document.addEventListener("DOMContentLoaded", () => {
  const cards = Array.from(document.querySelectorAll(".grid > div"));
  if (cards.length === 0) return;

  let activeIndex = 0;
  const cols = 3; // jumlah kolom di grid

  // ===== Highlight aktif =====
  function highlightCard(index) {
    cards.forEach((card, i) => {
      if (i === index) {
        card.classList.add(
          "ring-4", "ring-blue-500", "scale-105", "shadow-2xl",
          "z-10", "transition-transform", "duration-300"
        );
      } else {
        card.classList.remove(
          "ring-4", "ring-blue-500", "scale-105", "shadow-2xl", "z-10"
        );
      }
    });

    // Scroll agar card aktif terlihat
    cards[index].scrollIntoView({
      behavior: "smooth",
      block: "center",
      inline: "center"
    });
  }

  highlightCard(activeIndex);

  // ===== Navigasi antar kartu =====
  function moveSelection(direction) {
    const total = cards.length;
    const prevIndex = activeIndex;

    switch (direction) {
      case "Right": if (activeIndex < total - 1) activeIndex++; break;
      case "Left":  if (activeIndex > 0) activeIndex--; break;
      case "Down":  if (activeIndex + cols < total) activeIndex += cols; break;
      case "Up":    if (activeIndex - cols >= 0) activeIndex -= cols; break;
    }

    if (activeIndex !== prevIndex) highlightCard(activeIndex);
  }

  // ===== Buka game =====
  function openSelectedCard() {
    const link = cards[activeIndex].querySelector("a.text-blue-500");
    if (link) {
      link.classList.add("animate-pulse");
      setTimeout(() => (window.location.href = link.href), 200);
    }
  }

  // ===== Integrasi Controller =====
  if (window.GameController) {
    GameController.onMove("LeftStickRight", () => moveSelection("Right"));
    GameController.onMove("LeftStickLeft",  () => moveSelection("Left"));
    GameController.onMove("LeftStickUp",    () => moveSelection("Up"));
    GameController.onMove("LeftStickDown",  () => moveSelection("Down"));

    GameController.onMove("DPadRight", () => moveSelection("Right"));
    GameController.onMove("DPadLeft",  () => moveSelection("Left"));
    GameController.onMove("DPadUp",    () => moveSelection("Up"));
    GameController.onMove("DPadDown",  () => moveSelection("Down"));

    GameController.onPress("A", openSelectedCard);
    GameController.onPress("Cross", openSelectedCard);

    console.log("🎮 Controller navigation ready!");
  } else {
    console.warn("⚠️ GameController not detected. Make sure controller.js is loaded first!");
  }
});
