document.addEventListener('DOMContentLoaded', () => {
    let cardArray = [
        { name: 'tiramisu', img: 'images/tiramisu.jpg' },
        { name: 'cheese', img: 'images/cheese.jpg' },
        { name: 'vanilla', img: 'images/vanilla.jpg' },
        { name: 'matcha', img: 'images/matcha.jpg' },
        { name: 'strawberry', img: 'images/strawberry.jpg' },
        { name: 'blueberry', img: 'images/blueberry.jpg' },
        { name: 'tiramisu', img: 'images/tiramisu.jpg' },
        { name: 'cheese', img: 'images/cheese.jpg' },
        { name: 'vanilla', img: 'images/vanilla.jpg' },
        { name: 'matcha', img: 'images/matcha.jpg' },
        { name: 'strawberry', img: 'images/strawberry.jpg' },
        { name: 'blueberry', img: 'images/blueberry.jpg' }
    ];

    let score = 0;
    const grid = document.querySelector('.grid');
    const resultDisplay = document.querySelector('#result');
    const messageDisplay = document.createElement('h3'); // Untuk menampilkan pesan kemenangan
    grid.after(messageDisplay);

    let cardsChosen = [];
    let cardsChosenId = [];
    let cardsWon = [];

    function createBoard() {
        grid.innerHTML = "";
        messageDisplay.textContent = ""; // Hapus pesan kemenangan
        cardArray.sort(() => 0.5 - Math.random());
        cardsWon = [];
        score = 0;
        resultDisplay.textContent = score;

        cardArray.forEach((_, i) => {
            const card = document.createElement('img');
            card.setAttribute('src', 'images/blank.png');
            card.setAttribute('data-id', i);
            card.classList.add('card');
            card.addEventListener('click', flipCard);
            grid.appendChild(card);
        });
    }

    function checkForMatch() {
        const cards = document.querySelectorAll('.grid img');
        const [optionOneId, optionTwoId] = cardsChosenId;

        if (optionOneId === optionTwoId) {
            // Mencegah pemain memilih kartu yang sama dua kali
            cards[optionOneId].setAttribute('src', 'images/blank.png');
        } else if (cardsChosen[0] === cardsChosen[1]) {
            // Jika kartu cocok, ganti gambar dan nonaktifkan klik
            cards[optionOneId].setAttribute('src', 'images/white.png');
            cards[optionTwoId].setAttribute('src', 'images/white.png');
            cards[optionOneId].removeEventListener('click', flipCard);
            cards[optionTwoId].removeEventListener('click', flipCard);
            cardsWon.push(cardsChosen);
            score++;
        } else {
            // Jika kartu tidak cocok, balik lagi setelah 500ms
            setTimeout(() => {
                cards[optionOneId].setAttribute('src', 'images/blank.png');
                cards[optionTwoId].setAttribute('src', 'images/blank.png');
            }, 500);
        }

        // Reset pilihan
        cardsChosen = [];
        cardsChosenId = [];
        resultDisplay.textContent = score;

        // Cek apakah semua pasangan telah ditemukan
        if (cardsWon.length === cardArray.length / 2) {
            messageDisplay.textContent = "🎉 Congratulations! You found them all! 🎉";
        }
    }

    function restartGame() {
        createBoard(); // Panggil ulang fungsi untuk mereset game
    }

    function flipCard() {
        if (cardsChosen.length >= 2) return; // Cegah klik lebih dari dua kartu

        const cardId = this.getAttribute('data-id');

        // Pastikan kartu belum dipilih sebelumnya
        if (cardsChosenId.includes(cardId) || cardsWon.flat().includes(cardArray[cardId].name)) {
            return;
        }

        cardsChosen.push(cardArray[cardId].name);
        cardsChosenId.push(cardId);
        this.setAttribute('src', cardArray[cardId].img);

        if (cardsChosen.length === 2) {
            setTimeout(checkForMatch, 500);
        }
    }

    document.getElementById("restartBtn").addEventListener("click", restartGame);

    createBoard();
});
console.log("JavaScript Loaded");
