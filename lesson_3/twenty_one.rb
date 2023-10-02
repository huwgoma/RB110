require 'io/console'
require 'pry'

MAX_VALUE = 21
DEALER_MIN = 17
SUITS = ['Diamonds', 'Clubs', 'Hearts', 'Spades']
FACES = Array('2'..'10') + ['Jack', 'Queen', 'King', 'Ace']
CARD_VALUES = {
  'Jack' => 10, 'Queen' => 10, 'King' => 10,
  'Ace' => [1, 11]
}

# Game Prompts/Output
def prompt(str)
  puts ">> #{str}"
end

def display_rules
  system('clear')
  prompt("Welcome to #{MAX_VALUE}! The rules are as follows:")
  puts <<-HEREDOC
  1) You and the computer ('dealer') will both start with 2 cards. You will be 
     able to see both of your cards, but only one of the dealer's cards.
  2) You may 'hit' (draw) as many times as you like during your turn; 
      alternatively, you can 'stay' (pass) to end your turn.
  3) The goal of the game is to get your cards' value as close to #{MAX_VALUE} as
     possible, without going over. If you go over, you bust!
  3a) Cards 2-10 are worth their face values in points. Jacks, Queens, and Kings
     are worth 10. Aces are worth either 1 or 11, depending on whether your 
     hand total will exceed 21.
  4) If you stay, the dealer will hit until they reach a value of at least #{DEALER_MIN}.
     If the dealer busts, you win.
  5) If neither of you bust, whoever has the higher value wins!
    HEREDOC
end

def choose_number_of_wins
  loop do
    prompt("How many wins would you like to play up to?")
    input = gets.chomp
    return input.to_i if numeric?(input) && input.to_i.positive?
    prompt("Invalid input - Please enter a positive number!")
  end
end

def format_card_string(card)
  "#{card.last} of #{card.first}"
end

def display_game(hands, scores, hide_dealer: true)
  system('clear')
  display_scores(scores)
  display_cards(hands, hide_dealer: hide_dealer)
end

def display_scores(scores)
  prompt("Running Scores - Player: #{scores[:player]}, Dealer: #{scores[:dealer]}")
end

def display_cards(hands, hide_dealer: true)
  puts '=' * 50
  display_dealer_hand(hands[:dealer], hide_dealer)
  # Refactor at some point
  prompt("Player: #{hands[:player].map { |card| format_card_string(card) }}") 
  puts '=' * 50
end

def display_dealer_hand(hand, hidden=true)
  if hidden
    prompt("Dealer: #{format_card_string(hand.first)} + Hidden Card")
  else
    prompt("Dealer: #{hand.map { |card| format_card_string(card) }}") 
  end
end

def prompt_player_choice
  loop do
    prompt("Would you like to hit (H) or stay (S)?")
    choice = gets.chomp.downcase
    return choice[0] if ['hit', 'stay', 'h', 's'].include?(choice)
    prompt("Invalid input! Please enter H (hit) or S (stay).")
  end
end

def display_postgame(winner, player_total, dealer_total)
  display_bust(player_total, dealer_total)
  display_game_result(winner)
end

def display_game_result(winner)
  if winner.nil?
    prompt("It's a tie!")
  else
    # display hand value as well
    prompt("#{winner} wins!")
  end
end

def display_bust(player_total, dealer_total)
  prompt("You went over 21 - busted!") if busted?(player_total)
  prompt("The dealer went over 21 - busted!") if busted?(dealer_total)
end

def display_series_result(winner, scores)
  prompt("#{winner} wins with a score of #{scores[winner.downcase.to_sym]}-#{scores.values.min}!")
end

# Game Calculation/Logic
def initialize_deck
  SUITS.product(FACES)
end

def initialize_hands(deck)
  hands = { player: [], dealer: [] }
  hands.each { |_party, hand| deal_cards!(deck, hand, 2) } 
end

def deal_cards!(deck, hand, int=1)
  int.times do 
    card = deck.sample
    hand << deck.delete(card)
  end
end

def player_turn(deck, hands, scores)
  loop do
    choice = prompt_player_choice
    deal_cards!(deck, hands[:player]) if choice == 'h'
    display_game(hands, scores)
    current_total = total_value(hands[:player])
    break if choice == 's' || busted?(current_total)
  end
end

def dealer_turn(deck, hands, scores)
  loop do
    current_total = total_value(hands[:dealer])
    break if current_total >= DEALER_MIN || busted?(current_total)
    prompt("Dealer is now drawing...")
    sleep 1
    deal_cards!(deck, hands[:dealer])
    display_game(hands, scores, hide_dealer: false)
  end
end

def convert_face_value(value)
  numeric?(value) ? value.to_i : CARD_VALUES[value]
end

def numeric?(string)
  string.to_i.to_s == string
end

def busted?(total)
  total > MAX_VALUE
end

def total_value(hand)
  aces, non_aces = hand.partition { |card| card.last == 'Ace' }
  non_ace_sum = non_aces.map { |card| convert_face_value(card.last) }.sum

  ace_sum = calculate_ace_values(non_ace_sum, aces).sum
  non_ace_sum + ace_sum
end

def calculate_ace_values(sum, aces)
  ace_values = CARD_VALUES['Ace']
  aces.map do |ace|
    temp_sum = sum + ace_values.max

    ace_value = if temp_sum > MAX_VALUE
                  ace_values.min
                elsif temp_sum < MAX_VALUE
                  ace_values.max
                else
                  ace == aces.last ? ace_values.max : ace_values.min
                end
    sum += ace_value
    ace_value
  end
end

def determine_winner(hands, player_total, dealer_total)
  if busted?(player_total)
    'Dealer'
  elsif busted?(dealer_total)
    'Player'
  else
    return nil if tie?(player_total, dealer_total)
    player_total > dealer_total ? 'Player' : 'Dealer'
  end
end

def tie?(player_total, dealer_total)
  player_total == dealer_total
end

def increment_scores(scores, winner)
  return if winner.nil?
  scores[winner.downcase.to_sym] += 1
end

def determine_series_winner(scores)
  winner = scores.max_by { |_party, score| score }
  winner.first.to_s.capitalize
end

def play_again?
  loop do
    prompt("Would you like to play again? (Y/N)")
    input = gets.chomp.downcase
    return input == 'y' if ['y', 'n'].include?(input)
    prompt("Invalid input - please enter Y or N!")
  end
end

# Main Program 
display_rules
# Series Loop
loop do
  number_of_wins = choose_number_of_wins
  scores = { player: 0, dealer: 0 }
  # Game Loop
  loop do 
    deck = initialize_deck
    hands = initialize_hands(deck)
    display_game(hands, scores)

    player_turn(deck, hands, scores)
    player_total = total_value(hands[:player])

    dealer_turn(deck, hands, scores) unless busted?(player_total)
    dealer_total = total_value(hands[:dealer])

    winner = determine_winner(hands, player_total, dealer_total)
    increment_scores(scores, winner)
    display_game(hands, scores, hide_dealer: false)
    display_postgame(winner, player_total, dealer_total)

    break if scores.values.any?(number_of_wins)
    
    prompt("Press any key to continue:")
    $stdin.getch
  end
  
  series_winner = determine_series_winner(scores)
  display_series_result(series_winner, scores)

  break unless play_again?
end

prompt("Thanks for playing. Goodbye!")
