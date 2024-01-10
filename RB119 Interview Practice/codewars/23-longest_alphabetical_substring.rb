# Longest Alphabetical Substring
# Write a method that takes a string and returns the longest 
#   alphabetical substring from that string.
# - The input will always be at least one letter long, and will only 
#   consist of lowercase alphabetical letters.

# Input: A String
# Output: A new string containing the longest substring from the input string
#   whose characters are all in alphabetical order (a->z)

# Examples:
# longest('asd') == 'as'
# longest('nab') == 'ab'
# longest('abcdeapbcdef') == 'abcde'
# longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# longest('asdfbyfgiklag') == 'fgikl'
# longest('z') == 'z'
# longest('zyba') == 'z'

# Data: 
# The String given as input
# - Create an array of all substrings from input string
#   - Only the substrings whose characters are all in alphabetical order
#   (sorted)
# - Return the longest substring


# Algorithm (Efficient? Version):
# Given a string as input, str:
# - If str's characters sorted are equal to str itself, return str
# Initialize a new variable, longest_substring = ''
# Create an array of all alphabetical substrings from str:
#   Iterate over each index of str. For each index:
#     Starting from the current index, take a substring from `str`, taking 
#       longest substring <length> + 1 number of characters.
#       - If the substring is in alphabetical order:
#         - Reassign longest_substring to the substring
#       - Otherwise, skip to the next index.
#       - Stop the loop when length exceeds/equals str length - index.


# Algorithm (V2):
# Given a string as input, str:
# Initialize a new variable to track the current-longest alphabetical substring,
#   longest_substring = ''
# Go through each character of str and create substrings from that character.
# For each character:
#   - Substrings should start from that character
#   - Substrings should be longer than the current longest substring.
#   - Substrings should have a max length of string length - index of current character
#   Iterate through each index of str. For each index:
#     Initialize a max_length variable = str.length - index
#     Initialize a loop. For each iteration:
#       The starting length of substrings is equal to longest substring length + 1.
#         If starting length exceeds max length, exit iteration (return?)
#       Take substring from str, starting from `index`, for substring_length # of
#         characters.
#       If substring's characters are not in alphabetical order, exit iteration
#         and continue to the next index.
#       Otherwise (alphabetical), reassign longest substring to current substring
#         (which should be one character longer than the previous longest)
# Return longest

# def longest(str)
#   longest_substring = ''
#   str.chars.each_index do |index|
#     max_substr_length = str.length - index

#     until longest_substring.length + 1 > max_substr_length
#       substring = str[index, longest_substring.length + 1]
#       break unless substring == substring.chars.sort.join
#       longest_substring = substring
#     end
#   end
#   longest_substring
# end

def longest(str)
  (0...str.size).each_with_object('') do |index, longest_substr|
    max_substr_length = str.length - index

    until longest_substr.length + 1 > max_substr_length
      substr = str[index, longest_substr.length + 1]
      break unless alphabetical_order?(substr)
      longest_substr.replace(substr)
    end
  end
end

def alphabetical_order?(str)
  str == str.chars.sort.join
end








p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'


# 'asd'
# From Index 0, we set the longest substring to 'as', which has a length of 2.
# From Index 1, we must create a substring of at least length 3 - any substrings of length 1 or 2 
#   would not be considered the solution anyways (since they're not longer than the current longest
#   substring.) However, the maximum-length substring that can be created from Index 1 is 2 characters
#   (str.length - index) - we simply *cannot* create a substring of length 3 from Index 1.
# Therefore, since we cannot create a substring of length 3 from Index 1, there is no need to perform
#   any iteration from Index 1.