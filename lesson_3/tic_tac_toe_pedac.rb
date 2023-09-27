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

# New Series (Bo9)
# loop do
#   scores = { player: 0, cpu: 0 }

#   # New Game
#   loop do
#     board = create_board

#     # New Turn
#     loop do
#       display_game(board, scores)
  
#       player_move(board)
#       break if winner?(board) || tie?(board)
#       computer_move(board)
#       break if winner?(board) || tie?(board)
#     end


#     display_game(board, scores)

#     if winner?(board)
#       prompt("#{find_winner(board)} wins!")
#     else
#       prompt("It's a tie!")
#     end

    
    
#     scores[:player] += 1 if find_winner(board) == 'Player'
#     scores[:cpu] += 1 if find_winner(board) == 'Computer'

#     break if scores[:player] == 5 || scores[:cpu] == 5

#     prompt("Press any key to continue:")
#     STDIN.getch
#   end

#   puts 'Player wins!' if player_wins == 5 # Player wins 5-0!
#   puts 'Computer wins!' if computer_wins == 5 

#   break unless play_again?
# end

# puts "Thanks for playing!"



# FIX GAME LOOP SEQUENCE NEXT.
# Start program:
# -ask for name 
# -ask for marker choice
# 1) Start a new SERIES (best of 9).
#   => Reset scores to 0
#   => Start a new GAME (single game)
# 2) Create a new board for the new game
#   - Start the game:
# 3) Display the board (and scores)
# - Set the current_marker to PLAYER MARKER
# - Get the current player's move
# - Mark the board with the current player's marker (mark_board!)?

# 4) Check for a win/tie - break game loop if there is a win or tie
#   - if not, switch the current player


# 5) When the turn loop is broken: 
# - Increment the scores accordingly
# - Display the game board
# - Display who won the round (/if it was a tie)

# 6) Check if the SERIES (individual games) loop should be broken: 
# - Check if either player or cpu score is equal to 5.
# - If the loop is not broken, press any key to continue => next game of series


# 7) When the SERIES loop is broken:
# - Determine who the series winner was (should be the current player; alternatively, whoever has the higher score (max by score))
# - Display the winner and score by which they won
# - Ask if want play again? => Start new series
#   - if not: goodbye


# ====================================
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






# =========== Finding Wincons ============\
# Input: Hash representing a board.
#   Assume board size is a square (ie. 3x3, 4x4)

# Output: A nested array of subarrays representing all possible wincons
#   - Wincons are all horizontal rows, all vertical columns, and the two diagonals

# eg. # { 1 => " ", 2 => " ", 3 => " ",
#         4 => " ", 5 =>" ", 6 => " ",
#         7 => " ", 8 => " ", 9 => " " }


# (4x4)
# { 1, 2, 3, 4
#   5, 6, 7, 8,
#   9, 10,11,12,
#   13,14,15,16
# }

# [[1, 2, 3], [4, 5, 6], [7, 8, 9],
# [1, 4, 7], [2, 5, 8], [3, 6, 9],
# [1, 5, 9], [3, 5, 7]]

# Data: Hash (Board), nested array (return)

# Initialize a new empty array, wincons = []
# Find the length of the board: board size sqrt
#   eg. board size => 9; sqrt => 3



# Calculate Horizontal Wincons:
# Horizontal Start Cells: Select the first element from the board keys array, 
#   then every +<length> element from there, until horizontal size = length
#   eg. [1, 2, 3, 4, 5, 6, 7, 8, 9] => [1], [1, 4], [1, 4, 7]
#   Initialize an empty array, result = []
#   Transform: Iterate through [1, 4, 7]. For each element, calculate the squares 
#   that constitute a winning row and return them in an array, added to result.
#     - Until subarray size is <length>, add +1 to each element and append to subarr


# find_row_wincons
  # Input: An array of integers (1-9) and an integer representing the length (number of elements to take)
  #   board_keys = [1, 2, 3, 4, 5, 6, 7, 8, 9]; length = 3
  #                 0        3        6
  # Output: A new array containing every <3> elements from board_keys, starting with the first.
  #   row_start = [1, 4, 7]

  # Initialize an empty array, row_start = []
  # Selection: Iterate over the board_keys array, with index. For each integer:
  #   If the index is divisible by <3>, select the element 


    # From [1, 4, 7]:
  # Input: [1, 4, 7] array.
  # Output: An array of arrays. Each subarray represents a winning row and is size <length>.
  #   eg. [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  # Transform: Iterate through the input array. For each integer:
  #   Initialize an empty array, result = [].
  #   Until result size == length:
  #     Add the current integer to result
  #     Increment integer by 1
    # Return an array containing every <3> elements from board_keys.
    # eg. [1, 4, 7]

# Horizontal: 
#   - Each sequence of (length) keys = 1 row. 
#   +1 from the starting cell
#   eg. 1, 2, 3 is one row; 4, 5, 6; 7, 8, 9
#   Subarray size = board length

# Diagonal: 
#   - +4 and +2 (3x3)
#   - +5 and +3 (4x4)
#   - +6 and +4 (5x5)
#    Board length +/- 1 from starting cell.

