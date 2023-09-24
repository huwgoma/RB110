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
  system 'clear'
  prompt("You are #{PLAYER_MARKER}; Computer is #{COMPUTER_MARKER}.")
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

    
    # Iterate through each element of subarray. Check if the corresponding 
    # squares are all X or all O

    # If any subarray returns true, stop iterating and return the value of those
    # squares (x or o)
  end
  nil
  # Using x or o, match it to a string - player or computer
end

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


