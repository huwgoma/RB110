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
  display_cards(hands, hide_dealer)
end

def display_scores(scores)
  prompt("Player: #{scores[:player]}; Dealer: #{scores[:dealer]}")
end

def display_cards(hands, hide_dealer=true)
  display_dealer_hand(hands[:dealer], hide_dealer)
  # Refactor at some point
  prompt("Player: #{hands[:player].map { |card| format_card_string(card) }}") 
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

def display_game_result(winner)
  if winner.nil?
    prompt("It's a tie!")
  else
    prompt("#{winner} wins!")
  end
end

def display_series_result(winner, scores)
  prompt("#{winner} wins with a score of #{scores[winner.downcase.to_sym]}-#{scores.values.min}!")
end

# Game Calculation/Logic
def initialize_deck
  SUITS.product(FACES)
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
    break if choice == 's' || busted?(hands[:player])
  end
end

def dealer_turn(deck, hands, scores)
  until total_value(hands[:dealer]) >= DEALER_MIN || busted?(hands[:dealer])
    prompt("Dealer drawing...")
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

def busted?(hand)
  value = total_value(hand)
  value > MAX_VALUE
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

def determine_winner(hands)
  if busted?(hands[:player])
    'Dealer'
  elsif busted?(hands[:dealer])
    'Player'
  else 
    return nil if tie?(hands)
    hands.max_by { |_party, hand| total_value(hand) }.first.to_s.capitalize
  end
end

def tie?(hands)
  player_total = total_value(hands[:player])
  dealer_total = total_value(hands[:dealer])
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

# Refactor main loop (clean up)
loop do
  number_of_wins = choose_number_of_wins
  scores = { player: 0, dealer: 0 }
  loop do 
    deck = initialize_deck
    hands = { player: [], dealer: [] }
    
    deal_cards!(deck, hands[:player], 2)
    deal_cards!(deck, hands[:dealer], 2)

    display_game(hands, scores)
  
    player_turn(deck, hands, scores)
  
    if busted?(hands[:player])
      prompt("Busted!")
    else
      display_game(hands, scores, hide_dealer: false)
      dealer_turn(deck, hands, scores)
      prompt("Dealer busted") if busted?(hands[:dealer])
    end
    winner = determine_winner(hands)
    #binding.pry
    display_game_result(winner)

    increment_scores(scores, winner)
    display_scores(scores)
    break if scores.values.any?(number_of_wins)
    
    prompt("Press any key to continue:")
    $stdin.getch
  end
  
  series_winner = determine_series_winner(scores)
  display_series_result(series_winner, scores)

  break unless play_again?
end

prompt("Thanks for playing. Goodbye!")
