# Write a method that takes a string and returns the longest substring whose
#   characters are in alphabetical order.
# - Assume the input will only contain lowercase letters, and will always be
#   at least one letter long.
# - If there are multiple solutions, return the substring that appears first.

# Input: A String (at least one character)
# Output: A new string containing the first substring within the given input
#   string whose characters are all in alphabetical order.

# Examples:
# longest('asd') == 'as'
# longest('nab') == 'ab'
# longest('abcdeapbcdef') == 'abcde'
# longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# longest('asdfbyfgiklag') == 'fgikl'
# longest('z') == 'z'
# longest('zyba') == 'z'

# Data:
# The string given as input
# - Probably create an array of all substrings in the given str (incl. 1 char substrings)
# - Filter the substrings array to only keep those whose characters are in 
#   alphabetical order
# - Alphabetical order? -> If we sort the substring's characters in ascending order
#   a->z, it should remain the same as the unsorted version

# 'zyba' (Length 4)
# At index 0, we want a max substring of length 4
# At index 1, we want a max substring of length 3
# At index 2, we want a max substring of length 2
# And at index 3, we want a max substring of length 1
# Therefore: Exit iteration when length exceeds string length - index

# Algorithm:
# Given a string as input, str:
# Create an array of all alphabetical substrings:
#   Initialize a new array, alphabetical_sustrings = []
#   Iterate over each index of str. For each index:
#     Initialize a length variable = 1
#     Initialize a loop: Loop until length exceeds str length - index. On each loop:
#       Create a substring starting from index, taking length # of chars
#       - If the substring is equal to substring's chars sorted (then back to string),
#         add substring to substrings array
#         - Increment length by 1
#       - Otherwise, break out of the loop and continue to the next index.
# => Array of alphabetical substrings
# - Find the substring with the greatest length (# of characters)  

def longest(str)
  alphabetical_substrings = alphabetical_substrings(str)
  alphabetical_substrings.max_by(&:length)
end

# def alphabetical_substrings(str)
#   substrings = []
#   str.chars.each_index do |index|
#     length = 1
#     until length > str.length - index
#       substring = str[index, length]
#       if substring == substring.chars.sort.join
#         substrings << substring
#         length += 1
#       else
#         break
#       end
#     end
#   end
#   substrings
# end

# Refactor alphabetical_substrings algorithm/method:
# Given a string as input, str:
# Iterate over each index of str (0-str length, exclusive). For each index:
#   Create a substring of length 1
#   If substring is in alphabetical order, add substrings to array, then 
#     increment length by 1 and repeat
#   Otherwise, exit iteration and continue to the next index.
# Return substrings array

def alphabetical_substrings(str)
  (0...str.length).each_with_object([]) do |index, substrings|
    1.upto(str.length - index) do |length|
      substring = str[index, length]
      break unless substring == substring.chars.sort.join
      substrings << substring
    end
  end
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
