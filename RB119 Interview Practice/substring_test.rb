# Substring Test
# Given 2 strings, write a method that returns a Boolean:
# - true if the two strings have a substring in common
# - false otherwise
# For the purposes of this problem, substrings are any sequence of characters 
# that are:
# - Longer than 1 character
# - case does not matter
# - empty strings do not have any substrings

# Input:
#   Two strings, string_a and string_b
# Output:
#   A boolean: 
#   - true if string_a and string_b have any sequence of characters longer than 2
#     in common (case insensitive)
#   - false otherwise

# Examples:
# substring_test('Something', 'Fun') == false
# substring_test('Something', 'Home') == true
# substring_test('Something', 'Fun') == false
# substring_test('Something', '') == false
# substring_test('', 'Something') == false
# substring_test('BANANA', 'banana') == true
# substring_test('test', 'lllt') == false
# substring_test('', '') == false
# substring_test('1234567', '541265') == true
# substring_test('supercalifragilisticexpialidocious', 
#   'SoundOfItIsAtrociou') == true

# Data:
# The two strings given as input, string_a and string_b
# - Will need to create an array of all substrings in both strings (greater than
#   1 char long tho)
# - Compare the two arrays of substrings to check if they have any elements in 
#   common

# Algorithm:
# Given two strings as input, string_a and string_b:
# Create an array of the multi-char substrings in string_a and string_b
#   - Iterate over each index of the given string. For each index:
#     - Initialize a new variable, length = 2.
#     - Initialize a loop: while index + length is less than/equal to the 
#       string length:
#       - Create a substring from str, starting at index, taking <length> chars
#       - Increment length by 1
# Check if there is any element in common between substring_a and substrings_b
# - Array#&: Return a new array containing each element that is found in both
#   the calling Array and the given Array.
#   - Duplicates are omitted.
#   - Order is preserved from the calling Array
#   => ie. If the returned array is empty, there are no elements in common
# ie. If the returned array contains any elements, return true (string_a and 
#     string_b DO have a substring in common)

def substring_test(str_a, str_b)
  substrings_a = substrings(str_a.downcase, min_length: 2)
  substrings_b = substrings(str_b.downcase, min_length: 2)
  (substrings_a & substrings_b).any?
end

def substrings(str, min_length: 1)
  substrings = []
  str.chars.each_index do |index|
    length = min_length
    until index + length > str.length
      substrings << str[index, length]
      length += 1
    end
  end
  substrings
end



p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 
  'SoundOfItIsAtrociou') == true

