# Find the length of the longest substring in the given string that
#   is a palindrome (ie. the same in reverse)
# eg. "I like racecars" -> The longest palindromic substring would be
#   7 (racecar).
# - Return 0 if the given string is empty.

# Input: A String
# Output: An integer
# - represents the length of the longest palindromic substring
#   in the given string.

# Examples:
# longest_palindrome('a') == 1
# longest_palindrome('aa') == 2
# longest_palindrome('baa') == 2
# longest_palindrome('aab') == 2
# longest_palindrome('baabcd') == 4
# longest_palindrome('baablkj12345432133d') == 9
# longest_palindrome('') == 0

# Data:
#   The string given as input
#   - may need to create arrays of palindromic substrings

# Algorithm:
# Given a string as input, str:
# Create an array of all substrings in str.
# - Given a string, str:
#   Iterate over each index of str's characters (0->str length-1)
#     Take a slice from str, starting from index, ending at index.
#       Repeat, but make the substring one character longer (ie.
#         end one index greater)
#       Stop looping when the substring would exceed str's bounds
#         ie. Loop until the index + length > str's length

# Filter the list of substrings for only the palindromic substrings
#   (ie. substrings that are identical forward and back)
# Find the substring with the most number of characters and return
#   that substring's length (as integer)

def longest_palindrome(str)
  return 0 if str.empty?

  palindrome_substrings = substrings(str).select do |substr|
    substr == substr.reverse
  end
  palindrome_substrings.map(&:length).max
end

# Substrings:
# Iterate over each index of the given str. For each index, i = 0 ++,
#   Loop n times, where n is equivalent to string length - index.
#   eg. On the first index (0) of 'aab', we want to loop 3 times:
#       a, aa, aab.
#       On the second index (1), we want to loop 2 times: a, ab.
#   For each loop:
#     Take a slice from str, starting from index, ending at 
#       index + n counter

#   Take a slice of str, starting from index, ending at index + counter

# def substrings(str)
#   substrings = []
#   str.chars.each_index do |index|
#     length = 1
#     until index + length > str.length
#       substrings << str[index, length]
#       length += 1
#     end
#   end
#   substrings
# end

def substrings(str)
  substrings = []
  str.chars.each_index do |start_index|
    start_index.upto(str.length - 1) do |end_index|
      substrings << str[start_index..end_index]
    end
  end
  substrings
end


p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
p longest_palindrome('') == 0
p longest_palindrome('I like racecars') == 7