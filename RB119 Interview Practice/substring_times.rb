# Substring Times
# Given a non-empty string containing only lowercase alphabetic characters,
# return an array containing the minimum substring and the maximum number, 
# such that the entire string is equal to <min substring> * <max number> times.

# Input: A String
# Output: An array containing 2 items:
# - The smallest possible substring that can be repeated to reproduce the given string
# - The number of times the smallest possible substring needs to be 
#   multiplied to reproduce the given string

# Examples:
# 'ababab' => ['ab', 3] # 'ab' * 3 => 'ababab' (same as given str)
# 'abcde' => ['abcde', 1] (No smaller substring exists that can be 
#   multiplied to reproduce str)
# p substring_times('ababab') == ['ab', 3]
# p substring_times('abcde') == ['abcde', 1]

# Data:
# The string given as input 
# - Probably need to create an array of all possible substrings
# The array returned as output
# - contains the smallest possible repeatable substring and the number of times
#   it has to be repeated to reproduce str.

# Algorithm:
# Given a string as input, str:
# Create an array of all possible substrings within str:
#   - Iterate over each index of str. For each index:
#     - Create a substring from str, starting from current index, taking
#       (1..str length - index) characters.
#       Basically start at current index and take a substring of length 1, then 
#         length 2, length 3, ... until the end of the string is reached
#     - Add substring to substrings and return substrings arr at the end
# Sort substrings by length (ascending).
# Iterate through substrings. For each substring:
#   Check if the current substring can be multiplied by <some number> to 
#     reproduce str.
#   - <some_number> is equal to str's length divided by the current substring's length
#   If true, exit out of iteration and return the current substring and the 
#     <some_number> in an array
#   (will break at some point no matter what, because the last substring by length
#    will just be the entire string)

def substring_times(str)
  substrings = substrings(str).uniq.sort_by(&:length)
  substrings.each do |substr|
    multiplier = str.length / substr.length
    return [substr, multiplier] if substr * multiplier == str
  end
end

def substrings(str)
  substrings = []
  str.chars.each_index do |index|
    1.upto(str.length - index) do |length|
      substrings << str[index, length]
    end
  end
  substrings
end

p substring_times('ababab') == ['ab', 3]
p substring_times('abcde') == ['abcde', 1]