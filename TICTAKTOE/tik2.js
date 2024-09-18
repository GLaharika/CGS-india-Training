window.onload = function() {
    var boxes = document.getElementsByClassName("box");
    var currentPlayer = "X"; // Player X starts

    
    for (var i = 0; i < boxes.length; i++) {
        boxes[i].addEventListener("click", marker);
    }

    
    function marker(e) {
        var target = e.target;

        
        if (target.innerText === "") {
            target.innerText = currentPlayer;

       
            if (checkWin()) {
                alert(currentPlayer + " wins!");
                resetGame();
            } else if (isBoardFull()) {
                alert("It's a draw!");
                resetGame();
            } else {
                
                currentPlayer = (currentPlayer === "X") ? "O" : "X";
            }
        }
    }
    

    
    function checkWin() {
        var winPatterns = [
            [0, 1, 2], // Top row
            [3, 4, 5], // Middle row
            [6, 7, 8], // Bottom row
            [0, 3, 6], // Left column
            [1, 4, 7], // Center column
            [2, 5, 8], // Right column
            [0, 4, 8], // Diagonal from top left to bottom right
            [2, 4, 6]  // Diagonal from top right to bottom left
        ];

        var values = [];
        for (var i = 0; i < boxes.length; i++) {
            values.push(boxes[i].innerText);
        }

        console.log("Board values:", values);

        for (var pattern of winPatterns) {
            if (values[pattern[0]] === currentPlayer &&
                values[pattern[1]] === currentPlayer &&
                values[pattern[2]] === currentPlayer) {
                console.log("Winning pattern:", pattern);
                return true;
            }
        }
        return false;
    }


    function isBoardFull() {
        for (var i = 0; i < boxes.length; i++) {
            if (boxes[i].innerText === "") {
                return false;
            }
        }
        return true;
    }

    function resetGame() {
        for (var i = 0; i < boxes.length; i++) {
            boxes[i].innerText = "";
        }
        currentPlayer = "X"; 
    }
};

