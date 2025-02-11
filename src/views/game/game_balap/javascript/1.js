let timeLeft = 30; // Waktu mulai dari 30 detik
let timerElement = document.querySelector(".timer");

// Fungsi untuk memulai timer
function startTimer() {
  const countdown = setInterval(function () {
    timeLeft--;
    timerElement.innerHTML = `Time Left: ${timeLeft}s`;
    
    if (timeLeft <= 0) {
      clearInterval(countdown);
      alert("You win!");
    }
  }, 1000); // Update setiap detik
}

// Memulai timer saat halaman dimuat
startTimer();

addEventListener("keydown", function (e) {
  switch (e.code) {
    case "KeyW":
      KEYS.ArrowUp = true; // Tekan W sama seperti panah atas
      break;
    case "KeyA":
      KEYS.ArrowLeft = true; // Tekan A sama seperti panah kiri
      break;
    case "KeyS":
      KEYS.ArrowDown = true; // Tekan S sama seperti panah bawah
      break;
    case "KeyD":
      KEYS.ArrowRight = true; // Tekan D sama seperti panah kanan
      break;
  }
});

addEventListener("keyup", function (e) {
  switch (e.code) {
    case "KeyW":
      KEYS.ArrowUp = false;
      break;
    case "KeyA":
      KEYS.ArrowLeft = false;
      break;
    case "KeyS":
      KEYS.ArrowDown = false;
      break;
    case "KeyD":
      KEYS.ArrowRight = false;
      break;
  }
});

// Update instruksi dan timer di UI
document.querySelector(".instructions").innerHTML = `
<div>
  <span>W</span> accelerate
  <span>A</span> left
  <span>S</span> brake
  <span>D</span> right
</div>
<div class="timer">Time Left: 30s</div>`;
