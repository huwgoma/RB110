# Alphabet Symmetry
# Consider the word 'abode'. The letter 'a' is in position 1, 'b' is in position 2.
# - a and b are also in positions 1 and 2.
# 'd' and 'e' are in positions 4 and 5 in both 'abode' and in the alphabet.
# Given an array of words, return an array of integers, where each integer 
#   represents the number of letters whose position in the word matches the 
#   position in the alphabet.

# Input: An Array of strings
# - Will consist of both uppercase and lowercase; no spaces in each string
# Output: An Array of integers
# - Each integer represents the number of position-matching letters in each
#   word (case-insensitive)
# * position-matching means the letter's index in the word == the letter's index
#   in the alphabet

# Examples:
# symmetry(["abode","ABc","xyzD"]) == [4,3,1]
# symmetry(["abide","ABc","xyz"]) == [4,3,0]
# symmetry(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
# symmetry(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# Data:
# The array of strings given as input
# - Iterate through each string (transformation) -> array of integers
#   - Downcase each string
# Create an array of alphabet letters (lowercase)
# - For each word, iterate through the characters, with index.
#   - If the current index is equal to the index of the corresponding character
#     in ALPHABET, increment count by 1
#   - Return count to #map

# Algorithm:
# Given an array of strings as input:
# Create an array of lowercase alphabet letters (a..z)
# Iterate through strings (Transform). For each string:
#   Downcase the string
#   Initialize a new variable, count = 0
#   Iterate through the characters of the current string (w/ index) For each char:
#     If the current char's index in ALPHABET == current index, increment count 
#     by 1.
#   Return count from block
# -> Array of integers (counts of position-matching chars in each word)

ALPHABET = Array('a'..'z')

# def symmetry(strings)
#   strings.map do |string|
#     count = 0
#     string.downcase.chars.each_with_index do |char, index|
#       count += 1 if index == ALPHABET.index(char)
#     end
#     count
#   end
# end

# p symmetry(["abode","ABc","xyzD"]) == [4,3,1]
# p symmetry(["abide","ABc","xyz"]) == [4,3,0]
# p symmetry(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
# p symmetry(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

# Algorithm (V2):
# Given an array of strings as input, strings:
# Create array of lowercase alphabet letters (a..z)
# (Transform) Iterate through strings. For each string:
#   - Replace each string with the count of position-matching chars.
#   Downcase the string
#   Iterate through the characters of the current string with index. For each char:
#     Retrieve the character from ALPHABET with the current index. 
#     - If ALPHABET char is the same as current char, increment count by 1
#     reduce?
#     Return count from block

def symmetry(strings)
  strings.map do |str|
    count = 0
    str.downcase.each_char.with_index do |char, index|
      count += 1 if char == ALPHABET[index] 
    end
    count
  end
end

p symmetry(["abode","ABc","xyzD"]) == [4,3,1]
p symmetry(["abide","ABc","xyz"]) == [4,3,0]
p symmetry(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p symmetry(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]