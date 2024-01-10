# Find the Missing Letter
# Write a method that takes an array of consecutive increasing letters, and returns
#   the missing letter in the array.
# - Assume the input array will always be valid, and that there will always be 
#   exactly one missing letter.
#   - Input array length will always be at least 2, and will always contain
#     letters in only one case.

# Input: An array of strings
# - In alphabetical order, a->z 
# - One letter is missing
# - Letters are always the same case (but can be either upper or lower case)
# Output: A string
# - represents the missing letter from the array

# Examples:
# find_missing_letter(["a","b","c","d","f"]) == "e"
# find_missing_letter(["O","Q","R","S"]) == "P"
# find_missing_letter(["b","d"]) == "c"
# find_missing_letter(["a","b","d"]) == "c"
# find_missing_letter(["b","d","e"]) == "c"

# Can the missing letter be at one of the two ends? -> no?
# [bcde] - no way to tell whether the missing letter is a (start) or f (end)

# Data:
# The array of letter strings given as input
# - Create a range from first letter to last letter of array
# - Find the difference between the full range and the given array

# Algorithm:
# Given an array of strings as input, letters:
# Create a full range from letters (first..last)
# Find the difference between the full range and letters -> Missing letter(s)
# - Return the missing letter.


def find_missing_letter(letters)
  full_range = (letters.first..letters.last).to_a
  (full_range - letters).first
end

p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"
