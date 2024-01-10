# Scramblies
# Write a method that returns a boolean: true if a portion of str1's characters
#   can be rearranged to match str2; otherwise, false.
# - Assume the input strings will only contain lowercase letters (a-z);
#   no punctuation or digits.
# * Consider performance.

# Input: Two Strings, str1 and str2
# Output: A Boolean
# - True if str1 contains all characters of str2.

# Examples:
# scramble('rkqodlw',           'world'     ) == true
# scramble('cedewaraaossoqqyt', 'codewars'  ) == true
# scramble('katas',             'steak'     ) == false
# scramble('scriptjava',        'javascript') == true
# scramble('scriptingjava',     'javascript') == true

# s1 = "abcdefghijklmnopqrstuvwxyz" * 100_000
# s2 = "zyxcba" * 90_000
# scramble(s1, s2) == true

# Data:
# The two strings given as input, str1 and str2.
# - For each unique character in str2: 
#   - How many times does that character appear in str2? 
#   - How many times does that character appear in str1?
#   - If str1 count >= str2 count for all characters, return true.

# Algorithm:
# Given two strings as input, str1 and str2:
# Create an array of all unique characters in str2. 
# Iterate through str2's unique characters. For each character:
#   Count how many times the current char appears in str2;
#   Count how many times the current char appears in str1
#   - For all characters, str1 count of char must be greater than/equal to str2
#     count
# Return true if the above condition holds for all characters, false otherwise.



def scramble(str1, str2)
  str2.chars.uniq.all? do |char|
    str1.count(char) >= str2.count(char) 
  end
end

p scramble('rkqodlw',           'world'     ) == true
p scramble('cedewaraaossoqqyt', 'codewars'  ) == true
p scramble('katas',             'steak'     ) == false
p scramble('scriptjava',        'javascript') == true
p scramble('scriptingjava',     'javascript') == true
s1 = "abcdefghijklmnopqrstuvwxyz" * 100_000
s2 = "zyxcba" * 90_000
p scramble(s1, s2) == true