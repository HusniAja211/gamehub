document.addEventListener('DOMContentLoaded', () => {
    const GAME_CONFIG = {
      levels: [
        { uniqueCards: 3, matchesRequired: 2, timeLimit: 30 }, // Level 1: 30 detik
        { uniqueCards: 4, matchesRequired: 2, timeLimit: 30 }, // Level 2: 30 detik
        { uniqueCards: 4, matchesRequired: 3, timeLimit: 45 }, // Level 3: 45 detik
        { uniqueCards: 5, matchesRequired: 3, timeLimit: 45 }  // Level 4: 45 detik
      ],
      cardBackImage: 'images/blank.png',
      matchedImage: 'images/star.jpg',
      cardImages: [
        { name: 'tiramisu', img: 'images/tiramisu.jpg' },
        { name: 'cheese', img: 'images/cheese.jpg' },
        { name: 'vanilla', img: 'images/vanilla.jpg' },
        { name: 'matcha', img: 'images/matcha.jpg' },
        { name: 'strawberry', img: 'images/strawberry.jpg' },
        { name: 'blueberry', img: 'images/blueberry.jpg' },
        { name: 'chocolate', img: 'images/chocolate.jpg' },
        { name: 'lemon', img: 'images/lemon.jpg' },
        { name: 'caramel', img: 'images/caramel.jpg' },
        { name: 'mango', img: 'images/mango.jpg' }
      ]
    };
  
    const gameState = {
      currentLevel: 0,
      score: 0,
      cardArray: [],
      selectedCards: [],
      selectedIds: [],
      matchedCards: [],
      timer: null,
      timeLeft: 0
    };
  
    const elements = {
      grid: document.querySelector('.grid'),
      resultDisplay: document.querySelector('#result'),
      levelDisplay: document.createElement('div'),
      timerDisplay: document.createElement('div'),
      progressBarContainer: document.createElement('div'),
      progressBar: document.createElement('div'),
      messageDisplay: document.createElement('div'),
      restartBtn: document.getElementById('restartBtn')
    };
  
    function initGame() {
      setupDOM();
      startLevel();
    }
  
    function setupDOM() {
      elements.levelDisplay.className = 'level-display text-xl font-bold my-2';
      elements.timerDisplay.className = 'timer-display text-lg font-semibold my-1 text-red-600';
      elements.progressBarContainer.className = 'progress-bar-container w-full bg-gray-300 rounded h-4 overflow-hidden my-2';
      elements.progressBar.className = 'progress-bar bg-green-500 h-full transition-all';
      elements.messageDisplay.className = 'message-display text-2xl my-4';
  
      elements.progressBarContainer.appendChild(elements.progressBar);
      elements.grid.before(elements.levelDisplay);
      elements.grid.before(elements.timerDisplay);
      elements.grid.before(elements.progressBarContainer);
      elements.grid.after(elements.messageDisplay);
  
      if (elements.restartBtn) {
        elements.restartBtn.addEventListener('click', resetGame);
      }
    }
  
    function startLevel() {
      resetLevelState();
      prepareCardsForLevel();
      updateLevelDisplay();
      renderGameBoard();
      startTimer();
    }
  
    function resetLevelState() {
      gameState.selectedCards = [];
      gameState.selectedIds = [];
      gameState.matchedCards = [];
      elements.grid.innerHTML = '';
      elements.messageDisplay.textContent = '';
      stopTimer();
    }
  
    function prepareCardsForLevel() {
      const levelConfig = GAME_CONFIG.levels[gameState.currentLevel];
      const shuffledCards = [...GAME_CONFIG.cardImages].sort(() => Math.random() - 0.5);
      const selectedUniqueCards = shuffledCards.slice(0, levelConfig.uniqueCards);
  
      gameState.cardArray = [];
      selectedUniqueCards.forEach(card => {
        for (let i = 0; i < levelConfig.matchesRequired; i++) {
          gameState.cardArray.push({ ...card });
        }
      });
  
      gameState.cardArray.sort(() => Math.random() - 0.5);
    }
  
    function updateLevelDisplay() {
      const levelNumber = gameState.currentLevel + 1;
      const matchesRequired = GAME_CONFIG.levels[gameState.currentLevel].matchesRequired;
      elements.levelDisplay.textContent = `Level ${levelNumber} - Find ${matchesRequired} matching cards`;
      elements.resultDisplay.textContent = gameState.score;
    }
  
    function renderGameBoard() {
      gameState.cardArray.forEach((_, index) => {
        const cardElement = createCardElement(index);
        elements.grid.appendChild(cardElement);
      });
    }
  
    function createCardElement(index) {
      const card = document.createElement('img');
      card.src = GAME_CONFIG.cardBackImage;
      card.dataset.id = index;
      card.className = 'card cursor-pointer transition-transform hover:scale-105';
      card.addEventListener('click', handleCardClick);
      return card;
    }
  
    function handleCardClick(event) {
      const cardId = parseInt(event.target.dataset.id);
      const matchesRequired = GAME_CONFIG.levels[gameState.currentLevel].matchesRequired;
  
      if (
        gameState.selectedIds.length >= matchesRequired ||
        gameState.selectedIds.includes(cardId) ||
        gameState.matchedCards.includes(gameState.cardArray[cardId].name)
      ) {
        return;
      }
  
      event.target.src = gameState.cardArray[cardId].img;
      gameState.selectedCards.push(gameState.cardArray[cardId].name);
      gameState.selectedIds.push(cardId);
  
      if (gameState.selectedIds.length === matchesRequired) {
        setTimeout(checkMatch, 500);
      }
    }
  
    function checkMatch() {
      const allMatch = gameState.selectedCards.every(
        card => card === gameState.selectedCards[0]
      );
  
      if (allMatch) {
        handleMatch();
      } else {
        handleMismatch();
      }
  
      gameState.selectedCards = [];
      gameState.selectedIds = [];
    }
  
    function handleMatch() {
      gameState.matchedCards.push(...gameState.selectedCards);
  
      gameState.selectedIds.forEach(id => {
        const card = elements.grid.querySelector(`[data-id="${id}"]`);
        card.src = GAME_CONFIG.matchedImage;
        card.removeEventListener('click', handleCardClick);
      });
  
      const currentCardName = gameState.selectedCards[0];
      const countThisCard = gameState.matchedCards.filter(name => name === currentCardName).length;
      const matchesRequired = GAME_CONFIG.levels[gameState.currentLevel].matchesRequired;
  
      if (countThisCard === matchesRequired) {
        gameState.score++;
        elements.resultDisplay.textContent = gameState.score;
      }
  
      if (checkLevelCompletion()) {
        handleLevelCompletion();
      }
    }
  
    function handleMismatch() {
      gameState.selectedIds.forEach(id => {
        const card = elements.grid.querySelector(`[data-id="${id}"]`);
        card.src = GAME_CONFIG.cardBackImage;
      });
    }
  
    function checkLevelCompletion() {
      const levelConfig = GAME_CONFIG.levels[gameState.currentLevel];
      const totalPairsNeeded = levelConfig.uniqueCards;
      const uniqueMatchedPairs = [...new Set(gameState.matchedCards)].length;
      return uniqueMatchedPairs === totalPairsNeeded;
    }
  
    function handleLevelCompletion() {
      stopTimer();
      if (gameState.currentLevel >= GAME_CONFIG.levels.length - 1) {
        showGameComplete();
        return;
      }
  
      elements.messageDisplay.textContent = `Level ${gameState.currentLevel + 1} completed!`;
      gameState.currentLevel++;
      setTimeout(startLevel, 1500);
    }
  
    function showGameComplete() {
      elements.messageDisplay.textContent = "🎉 Congratulations! You've completed all levels! 🎉";
      setTimeout(() => {
        if (confirm("Game completed! Play again from Level 1?")) {
          resetGame();
        }
      }, 1500);
    }
  
    function resetGame() {
      stopTimer();
      gameState.currentLevel = 0;
      gameState.score = 0;
      startLevel();
    }
  
    // --- Timer Functions ---
    function startTimer() {
      const levelConfig = GAME_CONFIG.levels[gameState.currentLevel];
      gameState.timeLeft = levelConfig.timeLimit;
      updateTimerDisplay();
      updateProgressBar(1);
  
      gameState.timer = setInterval(() => {
        gameState.timeLeft--;
        updateTimerDisplay();
        updateProgressBar(gameState.timeLeft / levelConfig.timeLimit);
  
        if (gameState.timeLeft <= 0) {
          clearInterval(gameState.timer);
          handleTimeOut();
        }
      }, 1000);
    }
  
    function stopTimer() {
      if (gameState.timer) {
        clearInterval(gameState.timer);
        gameState.timer = null;
      }
    }
  
    function updateTimerDisplay() {
      elements.timerDisplay.textContent = `Time Left: ${gameState.timeLeft}s`;
    }
  
    function updateProgressBar(percent) {
      elements.progressBar.style.width = `${percent * 100}%`;
    }
  
    function handleTimeOut() {
      elements.messageDisplay.textContent = "⏰ Time's up! Restarting Level...";
      setTimeout(startLevel, 2000);
    }
  
    // Start the game
    initGame();
  });
  