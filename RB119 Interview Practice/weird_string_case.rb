# Weird String Case
# Write a method that takes a string and returns the same string with
#   all even-index characters in each word uppercased, and all odd-index 
#   characters in each word lowercased.
# - Assume the given string will consist only of alphabetic characters and spaces
# - Words are space-separated.

# Input: A String
# Output: The -same- string (same object?), but:
# - The characters at even indexes (for each word) are UPPERCASE
# - The characters at odd indexes (in each word) are lowercase.

# Examples:
# weirdcase("String") == "StRiNg"
# weirdcase("Weird string case") == "WeIrD StRiNg CaSe"

# weirdcase('This') == 'ThIs'
# weirdcase('is') == 'Is'
# weirdcase('This is a test') == 'ThIs Is A TeSt'

# Data:
# The string given as input
# - Will need to split into an array of words (split on spaces)
# - Will need to iterate through each word's characters with index

# Algorithm:
# Given a string as input, str:
# Split string into words on spaces. 
# (transform) Iterate over words. For each word:
#   - Create a new string (word) with the appropriate casing
#   (Transform) Iterate over word's characters with index. For each char:
#     If index is even, return the character but UPPERCASE
#     Otherwise (index odd) return the character but lowercase
#   => Array of transformed characters
#   - Join array back into a string (word)
# => Array of transformed words
# - Join array back into a string (full string)
# If we care about strictly returning the same string object that was passed in,
#   replace the given string's contents with the new string's contents

def weirdcase(str)
  str.split.map do |word|
    word.chars.map.with_index do |char, index|
      index.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end


p weirdcase("String") == "StRiNg"
p weirdcase("Weird string case") == "WeIrD StRiNg CaSe"

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'
