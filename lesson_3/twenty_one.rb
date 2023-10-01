require 'pry'

MAX_VALUE = 21

CARD_VALUES = {
  'Jack' => 10, 'Queen' => 10, 'King' => 10,
  'Ace' => [1, 11]
}
# Twenty-one
# 52-card deck:
#   4 suits (hearts/diamonds/clubs/spades)
#   13 values: 2-10, jack, queen, king, ace

# VS. Format: Dealer vs Player
# Wincon: Whoever ends closer to 21 (without going over) wins

# Game Format: 
# - Both participants are dealt 2 cards to start.
# Player starts first. Can choose to either 'hit' or 'stay'
# - Player has access to their hand of cards and one of the dealer's cards
# Player turn:
# - Hit: Draw another card from the deck
# - Stay: Pass and end player's turn
# - Loop until the player 'stays' OR 'busts' (over 21)
#   - If player busts, go straight to game over (dealer wins)

# After player stays, dealer's turn starts
# - Dealer must hit until the total is at least 17.
# - After 17, the dealer may continue to hit or stay.
# - Loop until the dealer stays or busts.
#   - If dealer busts, go straight to game over (player wins)

# If neither participant busts, compare the value of their hands.
#   Whoever has the higher value wins.

# Card values:
# 2-10: Face value
# Jack/queen/king: 10
# Ace: 1 or 11
#   - 11 if the sum of the hand does not exceed 21
#   - Different aces can have different values
#     - eg. 2 + ace + 5 + ace => 2 + 11 + 5 + 1
#     - The second ace cannot be 11 (>21) so it must be 1;
#     - The first ace remains 11 because WHEN it is added, the sum 
#     - of totals is < 21 (?)
#   10 + ace + ace - both aces must be 1 because otherwise total is 22 (10+11+1)
#   9 + ace + 3 - ace must be 1 because 9 + 11 + 3 > 21 
#   5 + ace + ace - ace # 1 is 11 (5+11 < 21), ace #2 is 1
#   add aces at the end - after all other values have been summed (starting sum)
#   - determine the value of each ace based on that order
#   - only one ace (max) can be 11

# Program Flow:
# Print hello + rules + etc
# 1) Initialize the 'deck' as a data structure
# 2) Deal cards to the player and the dealer from the deck
#   - Remove those cards from the deck and add them to the 
#   'player hand' and 'dealer hand' data structures respectively
# - Display the player's cards to the player + one dealer card (random)

# 3) Player Turn: Prompt the player to either hit or stay.
#   - Repeat loop until the player either 'stays' or busts
# 4) If player busts, the dealer wins (skip to declaring winner)
# 5) Dealer turn: Hit or stay
#   - Dealer does not get to choose whether they hit or stay:
#   - If total is < 17, hit; if total is >= 17, stay
#   - Loop until dealer stays or busts
# 6) If dealer busts, player wins (skip to winner)
# 7) Compare deck values and determine the winner
# 8) Play again?

# deck = [
#   ['Jack', 'Hearts'],
#   ['Ace', 'Spades'],
#   ['10', 'Hearts'], etc.
# ]

def prompt(str)
  puts ">> #{str}"
end

def format_card(card)
  "#{card.last} of #{card.first}"
end

def initialize_deck
  suits = ['Diamonds', 'Clubs', 'Hearts', 'Spades']
  faces = Array('2'..'10') + ['Jack', 'Queen', 'King', 'Ace']
  suits.product(faces)
end

def deal_cards!(deck, hand, int=1)
  int.times do 
    card = deck.sample
    hand << deck.delete(card)
  end
end

def display_cards(hands)
  system('clear')
  prompt("Dealer: #{format_card(hands[:dealer].first)} + Hidden Card")
  # Refactor later
  prompt("Player: #{hands[:player].map { |card| format_card(card) }}") 
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

deck = initialize_deck
hands = { player: [], dealer: [] }

deal_cards!(deck, hands[:player], 2)
deal_cards!(deck, hands[:dealer], 2)
display_cards(hands)

player_turn(deck, hands)

if busted?(hands[:player])
  prompt("Busted!") 
else
  # dealer_turn
end