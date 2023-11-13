# Given an array of strings consisting of only lowercase letters, return an 
# array containing all the characters that are present in every string of the
# given array, including duplicates. 
# eg. If a character occurs 3 times in every string, but 4 times in only one
# string, include that character 3 times.

# Input: An Array of Strings - assume all lowercase
# Output: A new array containing all the characters that appear in every
#   string of the given array.

# Examples:
# common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# common_chars(['cool', 'lock','cook']) == ['c', 'o']
# common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
# common_chars(['aabbaaaa', 'ccddddd', 'eeffee']) == []

# Data:
#   The array of strings given as input
#   The array of common characters that will be returned as output.

# Algorithm:
# Given an array of strings as input, strings:
# common_characters = []
# Iterate over the FIRST string's characters. For each character:
#   Count how many times that character appears in each of the other strings.
#     eg. 'cool' => 'c' => [1, 1, 1]
#   Take the smallest value among the character count numbers.
#     (ie. the word with the least occurrences of that character - how many times?)
#   Add the current character to the common_characters array IF common_characters
#     contains fewer instances of that character than the smallest count value.
#     ie. Add 'c' to common_characters IF common_characters contains fewer than 
#     1 ([1, 1, 1].min) instances of 'c'
# Return common_characters

def common_chars(strings)
  common_characters = []
  strings.first.each_char do |char|
    min_char_frequency = strings.map { |str| str.count(char) }.min
    common_characters << char if common_characters.count(char) < min_char_frequency
  end
  common_characters
end




p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']

p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
# p common_chars(['coloo', 'look', 'clook']) == ['o', 'l', 'o']
# p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
# p common_chars(['aabbaaaa', 'ccddddd', 'eeffee']) == []

