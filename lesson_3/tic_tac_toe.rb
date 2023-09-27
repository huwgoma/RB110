# Tic Tac Toe
require 'io/console'
require 'pry'

BOARD_LENGTH = 3

# Game Prompts
def prompt(str)
  puts ">> #{str}"
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
  prompt("Player (#{PLAYER_MARKER}): #{scores[:player]}; CPU (#{CPU_MARKER}): #{scores[:cpu]}")
end

def display_board(board)
  board.each do |key, value|
    separator = (key % BOARD_LENGTH).zero? ? "\n---+---+---\n" : "|"
    print " #{value} "
    print separator if key < board.size
  end
  puts "\n"
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

# Piece Placement
def player_move(board)
  input = ''
  loop do
    prompt("Pick an empty square (#{joinor(empty_squares(board))}):")
    input = gets.chomp

    break if valid_move?(input, board)
    prompt("Sorry, that's not a valid choice.")
  end
  board[input.to_i] = PLAYER_MARKER
end

def valid_move?(move, board)
  move.to_i.between?(1, board.size) &&
    empty_squares(board).include?(move.to_i)
end

# Computer Move
def computer_move(board)
  square = empty_squares(board).sample
  board[square] = CPU_MARKER if square
end

# Game Outcome Logic
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
    return 'Computer' if line.all? { |square| square == CPU_MARKER }
  end
  nil
end

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

# 5) When the game loop is broken: 
# - Increment the scores accordingly
# - Display the game board
# - Display who won the round (/if it was a tie)

# 6) Check if the SERIES loop should be broken: 
# - Check if either player or cpu score is equal to 5.
# - If the loop is not broken, press any key to continue => next game of series

# 7) When the SERIES loop is broken:
# - Determine who the series winner was (should be the current player; alternatively, whoever has the higher score (max by score))
# - Display the winner and score by which they won
# - Ask if want play again? => Start new series
#   - if not: goodbye



# "Get the current player's move"
#   Given a board and a ? representing the current player (player or cpu?)

name = prompt_name
PLAYER_MARKER, CPU_MARKER = choose_marker

# New Series (Bo9)
loop do
  scores = { player: 0, cpu: 0 }

  # New Game
  loop do
    board = create_board

    # New Turn
    loop do
      display_game(board, scores)
  
      player_move(board)
      break if winner?(board) || tie?(board)
      computer_move(board)
      break if winner?(board) || tie?(board)
    end


    display_game(board, scores)

    if winner?(board)
      prompt("#{find_winner(board)} wins!")
    else
      prompt("It's a tie!")
    end

    
    
    scores[:player] += 1 if find_winner(board) == 'Player'
    scores[:cpu] += 1 if find_winner(board) == 'Computer'

    break if scores[:player] == 5 || scores[:cpu] == 5

    prompt("Press any key to continue:")
    STDIN.getch
  end

  puts 'Player wins!' if player_wins == 5 # Player wins 5-0!
  puts 'Computer wins!' if computer_wins == 5 

  break unless play_again?
end

puts "Thanks for playing!"
