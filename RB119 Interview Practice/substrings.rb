# Given a string, return an array of all its substrings.

# Input: A String
# Output: An Array of all substrings in the given string.

# Examples:
# substrings('abc') == ['a', 'ab', 'abc', 'b', 'bc', 'c']

# Data:
# The string given as input
# - Iterate over each index of the string (0..String length - 1)
#                                      or (0...String length) (exclusive)
# - Create substrings starting from each index.
#   - Substrings start at length 1 and increment by 1, until the end of the string
#   eg. 'abc' (String Length = 3)
#       At Index 0 (a), we want a max-length substring of 3
#       At index 1 (b), we want a max-length substring of 2
#       At index 2 (c), we want a max-length substring of 1.
#   Therefore, we want length to range from *1* up to *String Length - Index*

# Algorithm:
# Given a string as input, str:
# Initialize a new array, substrings = []
# Iterate over each index of str. For each index: (index)
#   Initialize a loop from 1 to str.length - index. For each loop: (length)
#     Create a substring from str, starting from the current index, taking 
#       <length> number of characters.
#     Add the substring to substrings array
# Return substrings array

# substrings.rb
def substrings(str)
  # Iterate over each index of str
  (0...str.length).each_with_object([]) do |index, substrings|
    # Iterate from 1, until the end of the string is reached
    1.upto(str.length - index) do |length|
      substrings << str[index, length]
    end
  end
end

p substrings('abc') == ['a', 'ab', 'abc', 'b', 'bc', 'c']