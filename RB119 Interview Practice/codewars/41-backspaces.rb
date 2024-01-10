# Backspaces in String
# Assume a '#' is like a backspace in a string.
# eg. 'a#bc#d' is actually 'bd'

# Write a method that takes a string as input and returns the processed string.

# Input: A String
# - containing some characters, and possibly some '#' characters
# - each # character represents a backspace (deleting the most recent character 
#   from the string)
# Output: A new string
# - Result of processing the input string and taking each # into account

# Examples:
# clean_string('abc#d##c') == "ac"
# clean_string('abc####d##c#') == ""

# Data:
# The String given as input
# - Iterate through the string's characters and build a new string:
# - If character is a #, delete the last character from the string
# - Otherwise, add the current character to the new string

# Algorithm:
# Given a string as input, str:
# Initialize a new string, result = ''
# Iterate through each character of str. For each char:
#   If current character is a #, delete the last character from result
#   Otherwise, add char to result
# Return result

def clean_string(str)
  str.chars.each_with_object('') do |char, result|
    if char == '#'
      result.chop!
    else
      result << char
    end
  end
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""