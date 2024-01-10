# Weird String Case
# Write a method that takes a string and returns a new String with the following
#   modifications:
# - In each word (space-separated), even-indexed characters are uppercase, and
#   odd-indexed characters are lowercase.

# Input: A String
# Output: A new String, with following mods:
# - Even-index characters of each word are uppercase; odd-index characters of
#   each word are lowercase.

# Examples:
# weirdcase('This') == 'ThIs'
# weirdcase('is') == 'Is'
# weirdcase('This is a test') == 'ThIs Is A TeSt'

# Data:
# The String given as input
# - Split into an array of words.
# - For each word, iterate over each index and mutate the word accordingly
#   - If even, word[index] = word[index].upcase
#   - else word[index] = word[index].downcase
# - Join words back together with space

# Algorithm:
# Given a string as input, str:
# Split str into an array of words on spaces
# Iterate through words. For each word:
#   Iterate through each index of the current word's characters. For each index:
#   - If index is even, mutate the character in word at current index to uppercase
#   - If index is odd, mutate character in word at index to lowercase
# -> An array of mutated word objects
# - Join mutated words back together with a space.

# def weirdcase(str)
#   str.split.each do |word|
#     word.chars.each_index do |index|
#       char = index.even? ? word[index].upcase : word[index].downcase
#       word[index] = char
#     end
#   end.join(' ')
# end

# p weirdcase('This') == 'ThIs'
# p weirdcase('is') == 'Is'
# p weirdcase('This is a test') == 'ThIs Is A TeSt'

# Algorithm (Transformation):
# Given a string as input, str:
# Split str into an array of words (spaces)
# Iterate through words (transformation); for each word:
#   - Transform each word into a weirdcase version of the word
#   - Iterate through each character, with index. For each char:
#     - If index is even, create and return a new string, char.upcase
#     - Otherwise, create/return a new string, char.downcase
#   -> Join array of transformed characters together into a transformed word
# -> Join array of transformed words into a full string again (with spaces) 

def weirdcase(str)
  str.split.map do |word|
    word.chars.map.with_index do |char, index|
      index.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'