# A Pangram is a sentence that contains every letter of the alphabet at least once.
# eg. The quick brown fox jumps over the lazy dog.
# - Case is irrelevant.
# Given a string, detect whether it is a pangram or not. 
# - Return true if it is, false if not.
# - Ignore any numbers or punctuation.

# Input: A String
# Output: A Boolean
# - true if String contains all letters of the alphabet at least once
# - false otherwise.

# Examples:
# pangram?('The quick brown fox jumps over the lazy dog.') == true
# pangram?('This is not a pangram') == false

# Data:
# The string given as input
# - Probably iterate over each character (downcased)
#   - Skip non-alphabetic characters
# An array to define 'alphabetic characters' (lowercase)
# - Maybe iterate over the alphabet array and check that all 
#   letters are in the given string?

# Algorithm:
# Given a string as input, str:
# Downcase the str (non-mutating)
# Define an array of lowercase alphabetic characters.
# Iterate over ALPHABET. For each character of the alphabet:
#   Check if the current alphabet letter is in the given string (downcased)
#   - If it is not, stop iteration and return false
#   - All alphabet letters must be included in the given string for the overall
#     method to return true.

ALPHABET = Array('a'..'z')

def pangram?(str)
  str = str.downcase
  ALPHABET.all? { |letter| str.include?(letter) }
end

p pangram?('The quick brown fox jumps over the lazy dog.') == true
p pangram?('This is not a pangram') == false