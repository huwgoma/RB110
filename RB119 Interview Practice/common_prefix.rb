# Common Prefix
# Write a method to find the longest common prefix string in a given
# array of strings.
# - If there is no common prefix, return an empty string.
# - You may assume all given strings consist of lowercase letters

# Input: An array of strings (all lowercase)
# Output: A String
#   - Represents the longest common prefix among the given strings

# Examples:
# common_prefix(['flower', 'flow', 'flight']) == 'fl'
# common_prefix(['dog', 'racecar', 'car']) == ''
# common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
# common_prefix(['throne', 'throne')] == 'throne'

# Data:
#   The array of strings given as input
#   Each string within the given array

# Algorithm:
# Given an array of strings as input, strings:
# Create a new variable, prefix = ''

# Iterate through the FIRST string's characters; for each char:
#   If all other strings start with the prefix + current character,
#     add the current character to prefix.
#   Otherwise (ie not all strings start with prefix + current char),
#     return the current value of prefix.
# Return prefix.

def common_prefix(strings)
  prefix = ''
  strings.first.each_char do |char|
    if strings.all? { |str| str.start_with?(prefix + char) }
      prefix << char
    else
      return prefix
    end
  end
  prefix
end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['dog', 'racecar', 'car']) == ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['throne', 'throne']) == 'throne'
