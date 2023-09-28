# Tic Tac Toe
require 'io/console'
require 'pry'

BOARD_LENGTH = 3

# Game Prompts
def prompt(str)
  puts ">> #{str}"
end

def display_rules
  prompt("Welcome to Tic Tac Toe!")
  prompt("You will be playing a best-of-9 series against the computer. First to 5 wins!")
end

def prompt_name
  prompt("Hello! What's your name?")
  loop do
    name = gets.chomp
    return name unless name.strip.empty?
    prompt("Please enter a non-empty name :)")
  end
end

def joinor(array, separator=', ', last_separator='or')
  case array.size
  when 0, 1
    array.join
  when 2
    array.join(" #{last_separator} ")
  else
    array[-1] = "#{last_separator} #{array.last}"
    array.join(separator)
  end
end

def choose_marker
  prompt("Which marker would you like to play as? (X or O)")

  marker = nil
  loop do
    marker = gets.chomp.upcase
    break if ['X', 'O'].include?(marker)
    prompt("Invalid input - Please choose either X or O.")
  end
  unused_marker = marker == 'X' ? 'O' : 'X'  
  [marker, unused_marker]
end

# Game Display
def display_game(board, scores)
  system('clear')
  display_scores(scores)
  display_board(board)
end

def display_scores(scores)
  prompt("Player (#{PLAYER_MARKER}): #{scores['player']}; CPU (#{CPU_MARKER}): #{scores['cpu']}")
end

def display_board(board)
  board.each do |key, value|
    separator = (key % BOARD_LENGTH).zero? ? "\n---+---+---\n" : "|"
    print " #{value} "
    print separator if key < board.size
  end
  puts "\n"
end

def display_game_result(winner) # string or nil
  if winner == 'Player'
    prompt("You win! :)")
  elsif winner == 'CPU'
    prompt("Computer wins :(")
  else
    prompt("It's a tie!")
  end
end

def display_series_result(scores)
  winner = scores.max[0].capitalize
  prompt("#{winner} wins with a score of #{scores.max[1]}-#{scores.min[1]}!")
end

# Board:
# { 1 => " ", 2 => " ", 3 => " ",
#   4 => " ", 5 => " ", 6 => " ",
#   7 => " ", 8 => " ", 9 => " " }
def create_board
  (1..(BOARD_LENGTH**2)).map { |int| [int, int.to_s] }.to_h
end

def empty_squares(board)
  board.keys.reject { |key| [PLAYER_MARKER, CPU_MARKER].include?(board[key]) }
end

# Game Functions
def place_piece!(board, marker)
  move = if marker == PLAYER_MARKER
    prompt_player_move(board)
  elsif marker == CPU_MARKER
    cpu_move(board)
  end
  board[move] = marker #if marker
end

def prompt_player_move(board)
  loop do
    prompt("Pick an empty square (#{joinor(empty_squares(board))}):")
    input = gets.chomp

    return input.to_i if valid_move?(input, board)
    prompt("Sorry, that's not a valid choice.")
  end
end

def valid_move?(move, board)
  empty_squares(board).include?(move.to_i)
end

def cpu_move(board)
  empty_squares = empty_squares(board)
  # Return an integer representing the CPU's choice of move.

  # Priority hierarchy for CPU Moves:
  # 1) Squares that will result in victory if filled by the cpu (offense)
  defense_priority = find_cpu_priorities(board, PLAYER_MARKER).sample
  binding.pry
  offense_priority = find_cpu_priorities(board, CPU_MARKER).sample
  
  defense_priority || empty_squares.find { |sq| sq == 5 } || empty_squares.sample
  
  # 2) Squares that will result in defeat if filled by the player (defense)
  # 3) Square #5 (only if empty)
  # 4) Random square from the unoccupied squares
end

# Method that takes a board Hash and a marker type 
# - Returns an array of integers representing all empty squares in the board whose (win condition) neighbouring squares are 
#   occupied by 2 of the same marker.

def find_cpu_priorities(board, marker)
  wincons = find_wincons(board)

  empty_squares(board).select do |square|
    wincons.select { |line| line.include?(square) }.any? { |line| board.values_at(*line).count(marker) == 2 }
  end
  
  # Iterate through winconditions arrays. For each subarray:
  # Retrieve the corresponding values in the board hash. 
  # If the current subarray contains 2 markers of the same type, and 1 square included in empty squares, it is at risk

  
end



def cpu_defense(board)
  empty_squares(board).select do |square|
    wincons = find_wincons(board).select { |line| line.include?(square) }
   
    wincons.any? { |line| board.values_at(*line).count(PLAYER_MARKER) == 2 }
  end
end

# CPU AI Defense:
# If there is a wincon line that is 'at risk', prioritize that square.
#   'At risk': A line (array of 3 squares) that contains 2 PLAYER MARKERs and 1 empty marker
# eg.
# { 1 => "X", 2 => "2", 3 => "X",
#   4 => " ", 5 => " ", 6 => " ",
#   7 => " ", 8 => " ", 9 => " " }
# Line [1, 2, 3] is considered at risk because X |  | X -> Player can win by selecting 2.

# Input:
# Hash representing the board.
# Output: An Array containing all the integers that represent a square that is 'at risk'
# eg.
# { 1 => " ", 2 => "O", 3 => "X",
#   4 => "O", 5 => "X", 6 => "X",
#   7 => " ", 8 => " ", 9 => " " } => [7, 9]

# Data: 
#   Hash representing board
#   Array being returned
#   Nested array returned by find wincons [[1, 2, 3], [4, 5, 6], [7, 8, 9],
#                                          [1, 4, 7], [2, 5, 8], [3, 6, 9],
#                                          [1, 5, 9], [3, 5, 7]]

# alt.
# Iterate through the empty squares array. For each square:
#   Check if it is at risk and needs to be defended:
#     - Select all subarrays from wincons that contain the current square 
#     eg. square = 1; [[1, 2, 3], [1, 4, 7], [1, 5, 9]
#     - Iterate through each wincon and determine if any of them are 'at risk':
#       - If the current wincon subarray contains 2 player-marked squares, it is at risk (the 3rd one must necessarily be empty) 
#       => Add the current square to the returning array.
#   Return the result array















def increment_score(scores, winner)
  return if winner.nil?
  scores[winner.downcase] += 1
end

# Win-Finding Logic
def tie?(board)
  empty_squares(board).empty?
end

def winner?(board)
  !!find_winner(board)
end

def find_winner(board)
  win_conditions = find_wincons(board)

  # Splat operator (*) passes in each element of `line` as an argument to #values_at
  line_values = win_conditions.map { |line| board.values_at(*line) }

  line_values.each do |line|
    return 'Player' if line.all? { |square| square == PLAYER_MARKER }
    return 'CPU' if line.all? { |square| square == CPU_MARKER }
  end
  nil
end

# REFACTOR FIND WINCONS - save wincons into a constant, based only on the board size constant.
def find_wincons(board)
  board_length = Math.sqrt(board.size).to_i

  row_wincons = find_row_wincons(board, board_length)
  column_wincons = find_column_wincons(board, board_length)
  diagonal_wincons = find_diagonal_wincons(board, board_length)
  row_wincons + column_wincons + diagonal_wincons
end

def find_row_wincons(board, length)
  # Can also just use the #each_slice method but I wanted to do it without method hunting

  row_start_squares = board.keys.select.with_index { |_square, index| (index % length).zero? }

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

def find_diagonal_wincons(board, length)
  diagonal_start_squares = [board.keys.first, board.keys[length - 1]]

  diagonal_start_squares.map.with_index do |square, index|
    winning_diagonal = [square]
    increment = index.even? ? length + 1 : length - 1
    winning_diagonal << square += increment until winning_diagonal.size == length
    winning_diagonal
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

# Main Loop
# name = prompt_name ??
display_rules
PLAYER_MARKER, CPU_MARKER = choose_marker

# Series (Bo9)
loop do
  scores = { 'player' => 0, 'cpu' => 0 }

  # Game
  loop do
    board = create_board
    current_marker, next_marker = PLAYER_MARKER, CPU_MARKER

    # Game Turns
    loop do
      display_game(board, scores)
      place_piece!(board, current_marker)
      break if winner?(board) || tie?(board)
      current_marker, next_marker = next_marker, current_marker
    end

    winner = find_winner(board)
    increment_score(scores, winner)
    display_game(board, scores)
    display_game_result(winner)
    
    break if scores.values.any?(5)
    prompt("Press any key to continue:")
    STDIN.getch
  end
  display_series_result(scores)

  break unless play_again?
end
prompt("Thanks for playing. Goodbye!")
