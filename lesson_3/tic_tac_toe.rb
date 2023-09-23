# Tic Tac Toe


# { 1=>" ", 2=>" ", 3=>" ",
#   4=>" ", 5=>" ", 6=>" ", 
#   7=>" ", 8=>" ", 9=>" " }
def create_board 
  (1..9).map { |int| [int, " "] }.to_h
end

# 
def display_board(board)
  counter = 1
  board.each do |key, value|
    cell = " #{value} "
    print cell
    
    if counter < board.size 
      print (counter % 3).zero? ?  "\n---+---+---\n" : "|"
    end
    
    counter += 1
  end
  puts "\n"
end

board = create_board
display_board(board)


