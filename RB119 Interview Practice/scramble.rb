# Write a method that takes 2 strings and returns true if any characters
# of str1 can be rearranged to match str2.
# - Only lowercase alphabetic characters will be used.

# Input: Two Strings, str1 and str2
# Output: Boolean: 
#   - true if str1 contains the characters that make up str2 (order
#   not required)
#   - false otherwise

# Examples:
# scramble('javaass', 'jjss') == false
# scramble('rkqodlw', 'world') == true
# scramble('cedewaraaossoqqyt', 'codewars') == true
# scramble('katas', 'steak') == false
# scramble('scriptjava', 'javascript') == true
# scramble('scriptingjava', 'javascript') == true

# Data: 
#   str1 and str2 - may need to split str1 into an array of chars

# Algorithm:
# Given two strings as input, str1 and str2:
# Iterate through each character of str2. For each character:
#   - Does the current character appear in str1?
#   - Does str1 have at least equal/more than occurrences of the
#     current character than str2? (ie. not less)
#   If either condition returns false, return false.
#   If all characters of str2 pass the str1 character supply check,
#     return false.
#   - ie. If, for every character in str2, str1 has a matching character,
#         return true.

def scramble(str1, str2)
  str2.chars.all? do |char|
    str1.count(char) >= str2.count(char)
  end
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true