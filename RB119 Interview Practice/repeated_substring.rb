# Given a non-empty String, check if the given String can be constructed by 
# taking one of its substrings and concatenating multiple copies of that substring
# together.
# - You may assume the given string consists of lowercase characters only.

# Input: A String
# Output: A Boolean, true if any of the string's substrings can be multiplied to
#   produce the given String's value, false otherwise.

# Examples:
# repeated_substring("abab") == true
# repeated_substring("aba") == false
# repeated_substring("aabaaba") == false
# repeated_substring("abaababaab") == true
# repeated_substring("abcabcabcabc") == true

# Data:
#   The string given as input
#   - Will need to create an array of its substrings
#   - Only the substrings up to the halfway point of the string 
#   ie. str[0, length / 2]

# Algorithm:
# Given a string as input, str:
#   Create an array of str's substrings (up to halfway point of str)
#   - Initialize a loop and counter = 1. For each loop:
#       - Take a slice from str, starting from 0, for length <counter> (start 1)
#       - Add the slice to an array, substrings
#       - Increment counter by 1
#       - Stop looping when counter is greater than/equal to str length / 2
#   Iterate through substrings. For each substring:
#     Multiply the substring by n, where n is equal to str's length divided by
#       the current substring's length.
#     If the multiplied substring is equivalent to str, return true
#     Otherwise, continue to the next substring
#   If all substrings are iterated through without returning true, return false

def repeated_substring(str)
  substrings = substrings(str).select { |substr| substr.length <= str.length / 2 }
  
  substrings.any? do |substr|
    n = str.length / substr.length
    (substr * n) == str    
  end
end

def substrings(str)
  length = 1
  substrings = []

  while length <= str.length
    substrings << str[0, length]
    length += 1
  end
  substrings
end

p repeated_substring("abab") == true
p repeated_substring("aba") == false
p repeated_substring("aabaaba") == false
p repeated_substring("abaababaab") == true
p repeated_substring("abcabcabcabc") == true
