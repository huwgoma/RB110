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

def format_card(card)
  "#{card.last} of #{card.first}"
end

def initialize_deck
  SUITS.product(FACES)
end

def deal_cards!(deck, hand, int=1)
  int.times do 
    card = deck.sample
    hand << deck.delete(card)
  end
end

def display_cards(hands, hide_dealer: true)
  system('clear')  
  display_dealer_hand(hands[:dealer], hide_dealer)
  
  # Refactor later
  prompt("Player: #{hands[:player].map { |card| format_card(card) }}") 
end

def display_dealer_hand(hand, hidden=true)
  if hidden
    prompt("Dealer: #{format_card(hand.first)} + Hidden Card")
  else
    prompt("Dealer: #{hand.map { |card| format_card(card) }}") 
  end
end

def prompt_choice
  loop do
    prompt("Would you like to hit (H) or stay (S)?")
    choice = gets.chomp.downcase
    return choice[0] if ['hit', 'stay', 'h', 's'].include?(choice)
    prompt("Invalid input! Please enter H (hit) or S (stay).")
  end
end

def player_turn(deck, hands)
  loop do
    choice = prompt_choice
    deal_cards!(deck, hands[:player]) if choice == 'h'
    display_cards(hands)
    break if choice == 's' || busted?(hands[:player])
  end
end

def dealer_turn(deck, hands)
  until calculate_value(hands[:dealer]) >= DEALER_MIN || busted?(hands[:dealer])
    deal_cards!(deck, hands[:dealer])
    display_cards(hands, hide_dealer: false)
  end
end

def busted?(hand)
  value = calculate_value(hand)
  value > MAX_VALUE
end

def calculate_value(hand)
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

def convert_face_value(value)
  numeric?(value) ? value.to_i : CARD_VALUES[value]
end

def numeric?(string)
  string.to_i.to_s == string
end

def determine_winner(hands)
  if busted?(hands[:player])
    'Dealer'
  elsif busted?(hands[:dealer])
    'Player'
  else
    hands.max_by { |_party, hand| calculate_value(hand) }.first.to_s.capitalize
  end
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

# Choose number of rounds (series)
# on each round, reinitialize the deck and stuff
# After each series, ask if they want to play again

loop do
  number_of_wins = choose_number_of_wins
  scores = { player: 0, dealer: 0 }
  loop do 
    deck = initialize_deck
    hands = { player: [], dealer: [] }
    

    deal_cards!(deck, hands[:player], 2)
    deal_cards!(deck, hands[:dealer], 2)
    display_cards(hands)
  
    player_turn(deck, hands)
  
    if busted?(hands[:player])
      prompt("Busted!")
    else
      display_cards(hands, hide_dealer: false)
      dealer_turn(deck, hands)
      prompt("Dealer busted") if busted?(hands[:dealer])
    end
    winner = determine_winner(hands)
    prompt("#{winner} wins!")

    increment_scores(scores, winner)
    break if scores.values.any?(number_of_wins)
    binding.pry
    # Increment winner's score
    # check if any score value is = number of wins; break if true


    
    prompt("Press any key to continue:")
    $stdin.getch
  end
  break unless play_again?
end

prompt("Thanks for playing. Goodbye!")


# tie handling?