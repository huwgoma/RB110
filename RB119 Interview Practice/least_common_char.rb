# Least Common Char
# Write a method that takes a string as an argument and returns the character
#   that occurs least often in that string.
# - If there are multiple characters with the same lowest number of occurrences, 
#   return the one that appears first.
# - Uppercase and lowercase characters are considered the same.

# Input: A String
# Output: A new string containing the lowercase version of the character
#   that appears the least in the given string.
# - uppercase and lowercase both count for the same character.

# Example:
# p least_common_char("Hello World") == "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
# p least_common_char("Mississippi") == "m"
# p least_common_char("Happy birthday!") == ' '
# p least_common_char("aaaaaAAAA") == 'a'

# Data:
# The string given as input 
# - probably iterate over the string's characters
# - might need a hash to store frequency counts for each character
#   - make sure to downcase each character to standardize upper/lowercase counts

# Algorithm:
# Given a string as input, str:
# Create a hash with default values of 0, char_frequencies = Hash.new(0)
# Downcase the string, then iterate over each character of the downcased string.
# For each character:
#   Increment the corresponding value in char_frequencies by 1.
# => A hash containing key value pairs 'a' => (how many times 'a' or 'A' appears)
# Find the key-value pair with the lowest value
#   Return the key of that key-value pair

def least_common_char(str)
  char_frequencies = Hash.new(0)

  str.downcase.each_char do |char|
    char_frequencies[char] += 1
  end

  char_frequencies.min_by { |_char, count| count }.first
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'