var canvas = document.getElementById("canvas1");
var ctx = canvas.getContext("2d");

canvas.width = 500;
canvas.height = 550;

var x = canvas.width / 2;
var y = canvas.height - 30;
var dx = 2;
var dy = -2;

var ballRadius = 8;
var paddleHeight = 12;
var paddleWidth = 80;
var paddleX = (canvas.width - paddleWidth) / 2;
var rightPressed = false;
var leftPressed = false;

var brickRowCount = 6;
var brickColumnCount = 8;
var brickWidth = 45;
var brickHeight = 25;
var brickPadding = 5;
var brickOffSetTop = 50;

var score = 0;
var lives = 3;

var totalBrickWidth = brickColumnCount * brickWidth + (brickColumnCount - 1) * brickPadding;
var brickOffSetLeft = (canvas.width - totalBrickWidth) / 2;

var bricks = [];
for (let c = 0; c < brickColumnCount; c++) {
    bricks[c] = [];
    for (let r = 0; r < brickRowCount; r++) {
        bricks[c][r] = { x: 0, y: 0, status: 1 };
    }
}

document.addEventListener("keydown", keyDownHandler);
document.addEventListener("keyup", keyUpHandler);
document.addEventListener("mousemove", mouseMoveHandler);

function mouseMoveHandler(e) {
    var relativeX = e.clientX - canvas.offsetLeft;
    if (relativeX > 0 + paddleWidth / 2 && relativeX < canvas.width - paddleWidth / 2) {
        paddleX = relativeX - paddleWidth / 2;
    }
}

function drawBricks() {
    for (let c = 0; c < brickColumnCount; c++) {
        for (let r = 0; r < brickRowCount; r++) {
            if (bricks[c][r].status == 1) {
                var brickX = c * (brickWidth + brickPadding) + brickOffSetLeft;
                var brickY = r * (brickHeight + brickPadding) + brickOffSetTop;
                bricks[c][r].x = brickX;
                bricks[c][r].y = brickY;
                ctx.fillStyle = `hsl(${(c * 45) % 360}, 70%, 50%)`;
                ctx.fillRect(brickX, brickY, brickWidth, brickHeight);
                ctx.strokeStyle = "#fff";
                ctx.strokeRect(brickX, brickY, brickWidth, brickHeight);
            }
        }
    }
}

function showGameOver() {
  gameOver = true;
  const overlay = document.getElementById("gameOverScreen");
  overlay.classList.remove("hidden");
}


function keyDownHandler(e) {
    if (e.key === "ArrowRight") {
        rightPressed = true;
    } else if (e.key === "ArrowLeft") {
        leftPressed = true;
    }
}

function keyUpHandler(e) {
    if (e.key === "ArrowRight") {
        rightPressed = false;
    } else if (e.key === "ArrowLeft") {
        leftPressed = false;
    }
}

function drawBall() {
    ctx.beginPath();
    ctx.arc(x, y, ballRadius, 0, Math.PI * 2);
    ctx.fillStyle = "#FF4500";
    ctx.fill();
    ctx.closePath();
}

function drawPaddle() {
    ctx.fillStyle = "#32CD32";
    ctx.fillRect(paddleX, canvas.height - paddleHeight, paddleWidth, paddleHeight);
}

function drawLives() {
    ctx.font = "18px Arial";
    ctx.fillStyle = "#FF0000";
    ctx.fillText("Lives: " + lives, canvas.width - 100, 30);
}

function drawScore() {
    ctx.font = "18px Arial";
    ctx.fillStyle = "#000";
    ctx.fillText("Score: " + score, 20, 30);
}

function collisionDetection() {
    for (var c = 0; c < brickColumnCount; c++) {
        for (var r = 0; r < brickRowCount; r++) {
            var b = bricks[c][r];
            if (b.status == 1) {
                if (x > b.x && x < b.x + brickWidth && y > b.y && y < b.y + brickHeight) {
                    dy = -dy;
                    b.status = 0;
                    score++;
                    if (brickColumnCount * brickRowCount == score) {
                        alert("YOU WIN");
                        document.location.reload();
                    }
                }
            }
        }
    }
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = "#87CEEB";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    drawBricks();
    drawBall();
    drawPaddle();
    drawLives();
    drawScore();
    collisionDetection();
    
    if (y + dy < ballRadius) {
        dy = -dy;
    } else if (y + dy > canvas.height - 2 * ballRadius) {
        if (x > paddleX && x < paddleX + paddleWidth) {
            dy = -dy;
        } else {
            lives--;
            if (!lives) {
                showGameOver();
            } else {
                x = canvas.width / 2;
                y = canvas.height - 30;
                dx = 2;
                dy = -2;
                paddleX = (canvas.width - paddleWidth) / 2;
            }
        }
    }

    if (x + dx < ballRadius || x + dx > canvas.width - ballRadius) {
        dx = -dx;
    }
    if (rightPressed && paddleX < canvas.width - paddleWidth) {
        paddleX += 7;
    } else if (leftPressed && paddleX > 0) {
        paddleX -= 7;
    }
    x += dx;
    y += dy;
}

setInterval(draw, 10);
