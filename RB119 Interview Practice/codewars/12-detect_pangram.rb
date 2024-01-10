# Detect Pangram
# A Pangram is a sentence that contains every letter of the alphabet at least once
# - Case is irrelevant
# Write a method that takes a string and returns a boolean: true if the string is 
#   a pangram; false otherwise.
# - Ignore numbers and punctuation.

# Input: A String
# Output: A boolean
# - True if string contains all letters of alphabet at least once
# - false otherwise

# Examples:
# pangram?("The quick brown fox jumps over the lazy dog.") == true
# pangram?("This is not a pangram.") == false

# Data:
# The String given as input
# Probably need an array of alphabetical letters 
# - Iterate through each letter of the alphabet?
# - All letters of the alphabet must be included in the given string

# Algorithm:
# Given a string as input, str:
# Set string to lowercase
# Initialize an array of the alphabet, a->z (lowercase)
# Iterate through each letter of the alphabet. All letters must:
#   Be included in str.
#   - If any letter is not included in str, exit iteration and return false.

ALPHABET = Array('a'..'z')

def pangram?(str)
  str = str.downcase
  ALPHABET.all? { |letter| str.include?(letter) }
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false