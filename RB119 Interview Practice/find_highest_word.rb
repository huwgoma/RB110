# Find Highest-Scoring Word
# Given a string of words, find and return the word with the highest score.
# For each word, each letter is scored according to its position in the alphabet.
# - eg. a = 1, b = 2, c = 3, etc.
# eg. abad is 8: 1 + 2 + 1 + 4

# Return the highest-scoring word as a string.
# - If 2 words have the same score, return the one that appears first.
# - Assume all letters will be lowercase, and all inputs will be valid.

# Input: A String containing words
# Output: A new string containing the word that scores the 'highest'
# - Words are scored according to their letters' position in the alphabet.
# - a is worth 1, b is worth 2, etc.

# Examples:
# highest_word('bad adc') == 'adc'
#   'bad' => 2 + 1 + 4 (7); 'adc' => 1 + 4 + 3 => 8 
# highest_word('abad adc') == 'abad'
#   'abad' => 1 + 2 + 1 + 4 (8); 'adc' => 8 (but abad comes first)
# highest_word('man i need a taxi up to ubud') == 'taxi'
# highest_word('what time are we climbing up the volcano') == 'volcano'
# highest_word('take me to semynak') == 'semynak'
# highest_word('aa b') == 'aa'
# highest_word('b aa') == 'b'
# highest_word('bb d') == 'bb'
# highest_word('d bb') == 'd'
# highest_word('aaa b') == 'aaa'

# Data:
# The string given as input
# - Divide into an array of words (split on spaces)
# Calculate the score for each word and return the first word with the highest 
#   score

# Algorithm:
# Given a string of words as input, str:
# Split str into its words (on spaces). 
# Iterate over words. For each word:
#   Calculate the 'score' of the current word:
#   - Iterate through each character of the current word. For each char:
#     - Calculate its score based on the char's position in the ASCII table
#       eg. 'a' has an ASCII position value of 97 (subtract 96) => 1
#           'f' has a value of 102 (subtract 96) => 6
#     - Increment word_score by the character score
#   => An integer representing the current word's score
# Sort words by this calculated score (in DESCENDING order) 
# - If two words have the same score, preserve the order of appearance
# Return the first word.

def highest_word(str)
  str.split.sort_by do |word|
    -(word.chars.reduce(0) do |score, char|
      score += (char.ord - 96)
    end)
  end.first
end

# p highest_word('bad adc') == 'adc'
# p highest_word('abad adc') == 'abad'
# p highest_word('man i need a taxi up to ubud') == 'taxi'
# p highest_word('what time are we climbing up the volcano') == 'volcano'
# p highest_word('take me to semynak') == 'semynak'
# p highest_word('aa b') == 'aa'
# p highest_word('b aa') == 'b'
# p highest_word('bb d') == 'bb'
# p highest_word('d bb') == 'd'
# p highest_word('aaa b') == 'aaa'



# Further Exploration:
# def highest_word(str)
#   str.split.sort_by do |word|
#     word.chars.reduce(0) do |score, char|
#       score += (char.ord - 96)
#     end
#   end.reverse.first
# end

# Why does this second implementation return false on some of the test cases...
#   p highest_word('abad adc') == 'abad'
#   p highest_word('aa b') == 'aa'
#   p highest_word('b aa') == 'b'
#   p highest_word('bb d') == 'bb'
#   p highest_word('d bb') == 'd'
# But not the others?
#   p highest_word('what time are we climbing up the volcano') == 'volcano'

# If two words have the same score, sort_by will preserve insertion order:
# eg. [aa, b]: Both words have the same score (2), so sort_by will return
#     an array [aa, b]. 
# - If we chain #reverse to the returned array, it will unconditionally 
#   reverse the array elements: [b, aa]

# But if we specify a minus sort condition (-) for sort_by:
#   sort_by will sort in DESCENDING order, but elements with the same score
#     will still be in their original order.
#   eg. [aa, b, c] (with #reverse) => [aa, b, c] => [c, b, aa]
#       [aa, b, c] (with - sort) => [c, aa, b]