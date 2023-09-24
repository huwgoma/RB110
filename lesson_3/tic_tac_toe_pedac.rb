# Tic Tac Toe
# 2 player game.
#   Our version will be single-player, playing against the computer.
# Game is played on a 3x3 'board'. Players take turn marking a 'square' 
# on the board with their symbol (either X or O, decided at the start).
#   Squares can only be marked once (ie. if a square is already marked, it 
#   cannot be marked again.)
# The first player to mark 3 adjacent squares (diagonals included) wins.
# If all 9 squares are marked and neither player has 3 adjacent squares marked,
# the game ends in a tie.

# Flowchart:
# 1) Display the 3x3 board (empty)
# 2) Prompt the user to select a square to mark. 
#     - Validate the selected square (ie. cannot be occupied)
# 3) Computer marks a square.
# 4) Refresh the board display to reflect the changes.
# 5) If there is a winner, end the game and display the winner.
#    If the board is full, end the game and display a tie.
#    If there is no winner and the board is not full, loop back to step 2.
# 6) When the game is ended, ask the user if they want to play again.
#    If yes, loop back to #1. 
#    If no, exit the program.


# 1) Display the 3x3 empty board
# How to represent a 'board'? Hash? Nested Array?
# eg. Nested Array: board = [['X', 'O', ''], ['X', 'O', ''], ['O', '', 'X']]
# eg. Hash: board = { 1 => 'X', 2 => 'O', 3 => ' ', ...}
#     => X|O| 
#        X|O|  
#        O| |X

# ======= Display Board ======
# Input:   { 1=>" ", 2=>" ", 3=>" ",
#            4=>" ", 5=>" ", 6=>" ", 
#            7=>" ", 8=>" ", 9=>" " } 
#   Hash representing the board

# Output: 
#   1 | 2 | 3   0 | 1 | 2
#  ---+---+--- ---+---+---
#   4 | 5 | 6   3 | 4 | 5
#  ---+---+--- ---+---+---
#   7 | 8 | 9   6 | 7 | 8 (Counter = 0)

# Initialize a counter variable = 1
# Iterate through the hash. For each key value pair:
#   Create the cell (pad current value with spaces).
#   Print the cell.
#   If the counter variable is less than the hash size and:
#     Is divisible by 3: Print a new line + separator. 
#     Otherwise: print a pipe.
# Increment counter by 1.


# ===== Player Move =====
# Prompt the user to select a square (1-9).
#   Validate the input: 
#     - Must be within 1-9,
#     - The corresponding square must be empty
# If input is valid, mark the square:
#   - Change the corresponding square's value to 'X' or 'O' (depending on
#     the player's symbol.)