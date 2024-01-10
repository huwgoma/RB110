# Write a method that takes a string and returns an array of the substrings
#   obtained by splitting the string into two-character pairs.
# - If the string contains an odd number of characters, the missing second
#   character should be replaced with an underscore

# Input: A String
# Output: An array of 2-character substrings obtained from splitting the given
#   string 
# - If the last character pair is missing a letter, replace it with an underscore.

# Examples:
# 'abc' =>  ['ab', 'c_']
# 'abcdef' => ['ab', 'cd', 'ef']

# Data:
# The string given as input
# - Iterate over the string's characters 2 chars at a time
# - Join the 2 characters into a string and add to the output array
# The array of pair substrings we will return as output

# Algorithm:
# Given a string as input, str:
# Initialize a new array, pair_substrings = []
# Split str into an array of its characters.
# Iterate over characters, 2 at a time ( pair = [a, b]). For each pair:
#   - Add an underscore character to the pair array if pair only contains 1 char.
#   Join the pair (two characters) into a string and add it to pair_substrings
# Return pair_substrings

def pair_substrings(str)
  str.chars.each_slice(2).with_object([]) do |pair, substrings|
    pair << '_' if pair.one?
    substrings << pair.join
  end
end

p pair_substrings('abc') == ['ab', 'c_']
p pair_substrings('abcdef') == ['ab', 'cd', 'ef']

# How would you do this without #each_slice ?
# Algorithm:
# Given a string as input, str:
# Initialize a new array, pair_substrings.
# Iterate over each character of str using index. For each char:
#   If index is even:
#     Create a new substring from the current character and the char at the 
#       next index
#       (if next index char is nil, use an underscore instead)
#     Add substring to pairs
#   
# Return pairs

def pair_substrings(str)
  pairs = []
  str.chars.each_with_index do |char, index|
    if index.even?
      next_char = str[index + 1] || '_'
      pairs << char + next_char
    end
  end
  pairs
end

p pair_substrings('abc') == ['ab', 'c_']
p pair_substrings('abcdef') == ['ab', 'cd', 'ef']