# String Transformer
# Given a string, return a new string with the following transformations:
# - Reverse the case of every character (lower->upper; upper->lower)
# - Reverse the order of words.

# You will have to handle multiple spaces and leading/trailing spaces - how?

# Input: A String
# Output: A new string, with the following transformations:
# - The order of words is reversed
# - The case of each character is also reversed (lower -> upper and upper -> lower)

# Examples:
# string_transformer('Example Input') == 'iNPUT eXAMPLE'
# string_transformer('Example string') == 'STRING eXAMPLE'

# Data:
# The string given as input
# - Split string into words and then reverse the order of the words
# - Iterate through each character and switch the casing

# Algorithm:
# Given a string as input, str:
# (transform) Iterate over each character of str. For each character:
#   If the character is an alphabetic character between a-z, return 
#     character but uppercased (from block)
#   If character is alphabetic between A-Z, return char but lowercased
#   Otherwise, return char
# => An array of transformed characters (case swapped) -> Join together into a 
#   string again.
# Split the new string into an array of words, splitting on spaces
# Reverse the array of words and then join back together into a string.
# - Return that string

def string_transformer(str)
  swap_case = str.chars.map do |char|
    if char.between?('a', 'z')
      char.upcase
    elsif char.between?('A', 'Z')
      char.downcase
    else
      char
    end
  end.join

  swap_case.split.reverse.join(' ')
end

p string_transformer('Example Input') == 'iNPUT eXAMPLE'
p string_transformer('Example string') == 'STRING eXAMPLE'