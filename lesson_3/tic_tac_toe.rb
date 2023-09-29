# Tic Tac Toe
require 'io/console'
require 'pry'

BOARD_LENGTH = 3

# Game Prompts
def prompt(str)
  puts ">> #{str}"
end

def display_rules
  system("clear")
  puts <<-HEREDOC
Welcome to Tic Tac Toe!
You'll be playing a best-of-9 series against the CPU.
First to 5 wins!
  HEREDOC
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

def choose_marker_order
  prompt("Who should go first? (X or O).")
  prompt("If you want to let the computer decide, enter anything else.")
  input = gets.chomp.upcase
  if [PLAYER_MARKER, CPU_MARKER].include?(input)
    second_marker = input == PLAYER_MARKER ? CPU_MARKER : PLAYER_MARKER
    [input, second_marker]
  else
    [PLAYER_MARKER, CPU_MARKER].shuffle
  end
end

# Game Display
def display_game(board, scores)
  system('clear')
  display_scores(scores)
  display_board(board)
end

def display_scores(scores)
  prompt("Player (#{PLAYER_MARKER}): #{scores['Player']}
      CPU (#{CPU_MARKER}): #{scores['CPU']}")
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
  winner = scores.max_by { |_k, v| v }.first
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

# Placing Markers
def place_piece!(board, marker)
  move = if marker == PLAYER_MARKER
           prompt_player_move(board)
         elsif marker == CPU_MARKER
           cpu_move(board)
         end
  board[move] = marker
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
  defense_priority = find_cpu_priorities(board, PLAYER_MARKER).sample
  offense_priority = find_cpu_priorities(board, CPU_MARKER).sample

  offense_priority || defense_priority ||
    empty_squares.find { |sq| sq == 5 } || empty_squares.sample
end

def find_cpu_priorities(board, marker)
  empty_squares(board).select do |square|
    filtered_wincons = WIN_CONDITIONS.select { |line| line.include?(square) }
    filtered_wincons.any? { |line| board.values_at(*line).count(marker) == 2 }
  end
end

def switch_markers(marker1, marker2)
  [marker2, marker1]
end

# Win-Finding
def tie?(board)
  empty_squares(board).empty?
end

def winner?(board)
  !!find_winner(board)
end

def find_winner(board)
  # * preceding an Array argument passes each element of the Array as individual arguments to the method invocation
  line_values = WIN_CONDITIONS.map { |line| board.values_at(*line) }

  line_values.each do |line|
    return 'Player' if line.all? { |square| square == PLAYER_MARKER }
    return 'CPU' if line.all? { |square| square == CPU_MARKER }
  end
  nil
end

def calculate_wincons
  row_wincons = calculate_row_wincons(BOARD_LENGTH)
  column_wincons = calculate_column_wincons(BOARD_LENGTH)
  diagonal_wincons = calculate_diagonal_wincons(BOARD_LENGTH)
  row_wincons + column_wincons + diagonal_wincons
end

def calculate_row_wincons(length)
  (1..(length**2)).each_slice(length).to_a
end

def calculate_column_wincons(length)
  column_origins = Array(1..length)

  column_origins.map do |square|
    wincon = [square]
    wincon << square += length until wincon.size == length
    wincon
  end
end

def calculate_diagonal_wincons(length)
  diagonal_origins = [1, length]

  diagonal_origins.map.with_index do |square, index|
    wincon = [square]
    increment = index.even? ? length + 1 : length - 1
    wincon << square += increment until wincon.size == length
    wincon
  end
end

def increment_score(scores, winner)
  return if winner.nil?
  scores[winner] += 1
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

# Main Program
WIN_CONDITIONS = calculate_wincons

display_rules
PLAYER_MARKER, CPU_MARKER = choose_marker

# Series (Bo9)
loop do
  scores = { 'Player' => 0, 'CPU' => 0 }
  current_marker, next_marker = choose_marker_order
  # Game
  loop do
    board = create_board

    # Game Turns
    loop do
      display_game(board, scores)
      place_piece!(board, current_marker)
      break if winner?(board) || tie?(board)
      current_marker, next_marker = switch_markers(current_marker, next_marker)
    end

    winner = find_winner(board)
    increment_score(scores, winner)
    display_game(board, scores)
    display_game_result(winner)

    break if scores.values.any?(5)
    prompt("Press any key to continue:")
    $stdin.getch
    # Loser of current game gets to go first next game
    current_marker, next_marker = switch_markers(current_marker, next_marker)
  end
  display_series_result(scores)

  break unless play_again?
end
prompt("Thanks for playing. Goodbye!")
