require 'pry'
# Tic Tac Toe

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(str)
  puts ">> #{str}"
end

# Board
# { 1=>" ", 2=>" ", 3=>" ",
#   4=>" ", 5=>" ", 6=>" ", 
#   7=>" ", 8=>" ", 9=>" " } 
def create_board 
  (1..9).map { |int| [int, EMPTY_MARKER] }.to_h
end

def display_board(board)
  counter = 1
  board.each do |key, value|
    print " #{value} "
    
    if counter < board.size 
      print (counter % 3).zero? ?  "\n---+---+---\n" : "|"
    end
    
    counter += 1
  end
  puts "\n"
end

def empty_squares(board)
  board.select { |_int, str| str.strip.empty? }.keys
end

# Move
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

board = create_board
loop do
  system 'clear'
  display_board(board)
  player_move(board)
end


