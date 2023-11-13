# You are given a string, str, consisting of lowercase letters. 
# A duplicate removal consists of choosing two adjacent and equal letters 
# and removing them.

# We repeatedly make duplicate removals on 's' until we no longer can.

# Write a method that returns a string after all duplicate letters are removed.
  


# Input: A string of lowercase letters, str
# - Assume string is all lowercase letters
# Output: The same string str, with all adjacent duplicate letters removed

# Example:
# p remove_duplicates("aaybbyz") == "z"
# p remove_duplicates("a") == "a"
# p remove_duplicates("abbca") == "aca"
# p remove_duplicates("aabbcc") == ""
# p remove_duplicates("aderg") == "aderg"
# p remove_duplicates("azxxzy") == "ay"
# p remove_duplicates("abbaca") == "ca"

# Data: 
# The input str string?
# An array of the characters?

# Algorithm:
# Given a input string of lowercase letters, str:
# Initialize a loop and counter = 0
#   Retrieve the current and next character at index `counter`.
#   If the current character == next character, delete the current and 
#     next character from str; reset counter to 0
#   If current character and next character are not equal, increment counter by 1
#   Break loop if counter >= str.length
# Return str

def remove_duplicates(str)
  counter = 0
  loop do
    current_char = str[counter]
    next_char = str[counter + 1]

    if current_char == next_char
      str.slice!(counter, 2)
      counter = 0
    else
      counter += 1
    end
    break if counter >= str.length
  end
  str
end

p remove_duplicates("aaybbyz") == "z"
p remove_duplicates("a") == "a"
p remove_duplicates("abbca") == "aca"
p remove_duplicates("aabbcc") == ""
p remove_duplicates("aderg") == "aderg"
p remove_duplicates("azxxzy") == "ay"
p remove_duplicates("abbaca") == "ca"