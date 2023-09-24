require 'pry'
# Tic Tac Toe

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
BOARD_LENGTH = 3

def prompt(str)
  puts ">> #{str}"
end

# Board { 1 => " ", 2 => " ", 3 => " ",
#         4 => " ", 5 => " ", 6 => " ",
#         7 => " ", 8 => " ", 9 => " " }
def create_board
  (1..(BOARD_LENGTH**2)).map { |int| [int, EMPTY_MARKER] }.to_h
end

def display_board(board)
  system 'clear'
  prompt("You are #{PLAYER_MARKER}; Computer is #{COMPUTER_MARKER}.")

  board.each do |key, value|
    print " #{value} "
    if key < board.size
      print (key % BOARD_LENGTH).zero? ? "\n---+---+---\n" : "|"
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
  move.to_i.between?(1, board.size) &&
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
  win_conditions = find_wincons(board)

  # Splat operator (*) passes in each element of `line` as an argument to #values_at
  line_values = win_conditions.map { |line| board.values_at(*line) } 

  line_values.each do |line|
    return 'Player' if line.all? { |square| square == PLAYER_MARKER } 
    return 'Computer' if line.all? { |square| square == COMPUTER_MARKER}
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
