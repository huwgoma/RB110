# Repeated Substring
# Given a non-empty string, s, find the minimum substring t, and the maximum number
# k, such that the entire string s can be reproduced by t * k
# - Assume the input string will consist of lowercase latin letters.
# Return t and k in an array [t,k]

# Input: A String
# Output: An Array (2 elements)
# - The smallest substring that can be multiplied by an integer n to reproduce
#   the given string
# - The integer n 

# Examples:
# f("ababab") == ["ab", 3]
# f("abcde") == ["abcde", 1]

# Data:
# The string given as input
# - Probably create an array of all unique substrings within the string
# - Iterate through substrings and test if each substsring can be multiplied 
#   by some number to reproduce the given string
# The array returned as output (containing substring, integer)

# Algorithm:
# Given a string as input, str:
# Create an array of all unique substrings within str
#   - Iterate through each index of str. For each index:
#     - Create a substring starting from index, for length 1.
#     - Increment length by 1.
#     - Repeat until length exceeds string length - index
#       eg. abcd: At index 0 (a), take a, ab, abc, abcd
#                 At index 1 (b), take b, bc, bcd

# Iterate through substrings. FOr each substring:
#   Multiply the substring by an integer n, such that the length of the resulting
#     string will equal the length of the given string.
#   eg. 'ababab' - length is 6; for substring 'a', we need to multiply 'a' by 6
#     to achieve a string of length 6; for substring 'ab', multiply by 3, etc.
#     n = str length / substring length
#   If the resulting string is equal to the given string, return 
#     [string, n]

def f(str)
  substrings = substrings(str).uniq
  substrings.each do |substring|
    n = str.length / substring.length
    return [substring, n] if substring * n == str
  end
end

def substrings(str)
  substrings = []
  str.chars.each_index do |index|
    length = 1
    until length > str.length - index
      substrings << str[index, length]
      length += 1
    end
  end
  substrings
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]