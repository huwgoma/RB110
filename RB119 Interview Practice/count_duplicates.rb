# Count Duplicates
# Write a method that takes a string and returns the count of the 
# distinct alphanumeric characters that occur more than once in the given string.
# - Case does not matter (ie. 'A' and 'a' are counted the same)
# - The input string will only contain alphanumeric characters.
# ie. Given a string, count how many unique characters in the string occur
#     more than once

# Input: A String
# Output: An integer representing the number of unique characters that occur
#   at least twice in the string.

# Examples:
# duplicate_count("") == 0
# duplicate_count("abcde") == 0
# duplicate_count("abcdeaa") == 1
# duplicate_count("abcdeaB") == 2
# duplicate_count("Indivisibilities") == 2

# Data:
# The string given as input 
# - probably iterate over each character?
# A hash to keep track of how many times each character appears in the string

# Algorithm:
# Given a string as input, str:
# Initialize a new hash, char_counts = {} (default value 0)
# Iterate over each character of str. For each char:
#   Increment the corresponding key-value value in char_counts by 1
# Count the number of key-value pairs in char_counts that have a value 
#   greater than 1.

def duplicate_count(str)
  char_counts = Hash.new(0)
  str.downcase.each_char { |char| char_counts[char] += 1 }
  char_counts.values.count { |freq| freq > 1 }
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
