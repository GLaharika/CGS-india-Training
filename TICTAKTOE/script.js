let currentPlayer = "X";
let board = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
];
let isGameOver = false;

function marker(e){
    alert(e.target.innerText)
}

window.onload = function() {
    // Initialize event listeners for all cells
    for (let row = 0; row < 3; row++) {
        for (let col = 0; col < 3; col++) {
            document.getElementById(`cell-${row}-${col}`).onclick = function() {
                makeMove(row, col);
            };
        }
    }
};

function makeMove(row, col) {
    if (!board[row][col] && !isGameOver) {
        board[row][col] = currentPlayer;
        document.getElementById(`cell-${row}-${col}`).innerText = currentPlayer;

        if (checkWinner()) {
            document.getElementById("status").innerText = `${currentPlayer} Wins!`;
            isGameOver = true;
        } else if (board.flat().every(cell => cell !== "")) {
            document.getElementById("status").innerText = "It's a Draw!";
            isGameOver = true;
        } else {
            currentPlayer = currentPlayer === "X" ? "O" : "X";
        }
    }
}

function checkWinner() {
    const winPatterns = [
        // Rows
        [[0, 0], [0, 1], [0, 2]],
        [[1, 0], [1, 1], [1, 2]],
        [[2, 0], [2, 1], [2, 2]],
        // Columns
        [[0, 0], [1, 0], [2, 0]],
        [[0, 1], [1, 1], [2, 1]],
        [[0, 2], [1, 2], [2, 2]],
        // Diagonals
        [[0, 0], [1, 1], [2, 2]],
        [[0, 2], [1, 1], [2, 0]]
    ];

    return winPatterns.some(pattern =>
        pattern.every(([r, c]) => board[r][c] === currentPlayer)
    );
}

function resetGame() {
    board = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
    ];
    currentPlayer = "X";
    isGameOver = false;
    document.querySelectorAll(".cell").forEach(cell => cell.innerText = "");
    document.getElementById("status").innerText = "";
}
