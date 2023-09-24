require 'pry'
# Tic Tac Toe

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(str)
  puts ">> #{str}"
end

# Board
# { 1 => " ", 2 => " ", 3 => " ",
#   4 => " ", 5 =>" ", 6 => " ",
#   7 => " ", 8 => " ", 9 => " " }
def create_board
  (1..9).map { |int| [int, EMPTY_MARKER] }.to_h
end

def display_board(board)
  system 'clear'
  prompt("You are #{PLAYER_MARKER}; Computer is #{COMPUTER_MARKER}.")

  board.each do |key, value|
    print " #{value} "

    if key < board.size
      print (key % 3).zero? ? "\n---+---+---\n" : "|"
    end
  end
  puts "\n"
end

def empty_squares(board)
  board.select { |_int, str| str.strip.empty? }.keys
end

# Player Move
def player_move(board)
  input = ''
  loop do
    prompt("Pick an empty square (#{empty_squares(board).join(', ')}):")
    input = gets.chomp

    break if valid_move?(input, board)
    prompt("Sorry, that's not a valid choice.")
  end
  board[input.to_i] = PLAYER_MARKER
end

def valid_move?(move, board)
  move.to_i.between?(1, 9) &&
    empty_squares(board).include?(move.to_i)
end

# Computer Move
def computer_move(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER if square
end

# Game Outcome Logic
def tie?(board)
  empty_squares(board).empty?
end

def winner?(board)
  !!find_winner(board)
end

def find_winner(board)
  # Return a string representing the winner ("player" or "computer")
  # nil if no winner
  
  # Input: Hash representing the board
  # Output: String representing the winner (Player or Computer); nil if no winner

  # Define a constant WIN_CONDITIONS - a 2D array of all winning combinations
  #   for the given board size
  # Iterate through win conditions. For each subarray:
  #   Find the values at the corresponding board cells in the current subarray.
  #   eg. [1, 2, 3] ; board's values at 1, 2, 3 => ["X", "X", "O"]
  #   Find the first value in the line. 
  #   If the first value is X or O (ie. not default empty), iterate through the
  #   subarray of values. For each value:
  #   Determine whether ALL values are equal to the first element. If yes, 
  #   return true; otherwise, false.

  #   If ALL values == first element, return a string: 
  #     Player if first element == PLAYER MARKER, computer vice versa

  #   Return nil if none of the win conditions return true
  
  
  find_wincons(board)
  
  
  win_conditions = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],
                    [1, 5, 9], [3, 5, 7]]
  
  
  
  
  
  
  

  win_conditions.each do |subarr|
    if board[subarr[0]] == PLAYER_MARKER &&
       board[subarr[1]] == PLAYER_MARKER &&
       board[subarr[2]] == PLAYER_MARKER
      return 'Player'
    elsif board[subarr[0]] == COMPUTER_MARKER &&
          board[subarr[1]] == COMPUTER_MARKER &&
          board[subarr[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def find_wincons(board)
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
wincons = []
board_length = Math.sqrt(board.size).to_i
row_wincons = find_row_wincons(board, board_length)
column_wincons = find_column_wincons(board, board_length)
binding.pry


# Diagonal: 
#   - +4 and +2 (3x3)
#   - +5 and +3 (4x4)
#   - +6 and +4 (5x5)
#    Board length +/- 1 from starting cell.

# Algorithm:
#   Initialize a counter variable = 0
#   Initialize an empty array, wincons = []
#   Calculate the length of the board. sqrt(board size)


# Diagonal Start Cells: Select the first element and the <length> element:
#   eg. #   eg. [1, 2, 3, 4, 5, 6, 7, 8, 9] - Select first (1) and 3rd (3)

end

def find_row_wincons(board, length)
  # Can also just use the #each_slice method but I wanted to do it without method hunting
  row_start_squares = board.keys.select.with_index { |square, index| (index % length).zero? }

  row_start_squares.map do |square|
    winning_row = [square]
    winning_row << square += 1 until winning_row.size == length
    winning_row
  end
end

def find_column_wincons(board, length)
  column_start_squares = board.keys.first(length)
  
  column_start_squares.map do |square|
    winning_column = [square]
    winning_column << square += length until winning_column.size == length
    winning_column
  end
end



# Again?
def play_again?
  loop do
    prompt("Play again? Y/N")
    input = gets.chomp.upcase
    return input == 'Y' if ['Y', 'N'].include?(input)
    prompt("Invalid input! Please enter Y to play again or N to quit.")
  end
end

loop do
  board = create_board

  loop do
    display_board(board)

    player_move(board)
    break if winner?(board) || tie?(board)
    computer_move(board)
    break if winner?(board) || tie?(board)
  end
  display_board(board)

  if winner?(board)
    prompt("#{find_winner(board)} wins!")
  else
    prompt("It's a tie!")
  end

  break unless play_again?
end

puts "Thanks for playing!"
