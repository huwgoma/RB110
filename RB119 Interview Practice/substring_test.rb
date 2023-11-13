# Given 2 strings, write a method that determines if the two strings
# share a common substring.
# - Return true if there is a substring that appears in both strings
# - false otherwise
# Substring: Any sequence of characters longer than 1 
# - substrings are case-insensitive
# - empty strings should always return false (bc empty strings 
#   have no substrings)

# Input: Two strings
# Output: A boolean
# - True if both strings share a common substring (longer than 1 character)
# - False otherwise

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
#   The two strings given as inputs
#   - Probably will need to create an array of all substrings (longer than 1 character)
#     in each string.

# Algorithm:
# Given two strings, str1 and str2:
# Create two arrays of the substrings (>1 char) in str1 and str2.
#   Given a string, str:
#     - Iterate through each index of str, skipping the last index (skip the last character 
#       because substrings starting from the last character will only be 1 char long)
#     - For each index, take a substring from str of length <length> (start at 2), starting from index
#       - Add substring to substrings array.
#       - Increment length by 1.
#       - Keep looping until the length of the substring would exceed the length of the 
#         string, starting from the current index.
#       eg. Home - length = 2, index = 0 (H) => Ho (length 2) -> Hom (length 3) -> Home (length 4) 
#           -> (length 5 would be greater than the length of 'Home' starting from index 0 (H))
#           (H)ome - length = 2, index = 1 (o) => om (length 2) -> ome (length 3)
#           -> (length 4 would be greater than the length of 'Home', starting from index 1(o))
#     Return substrings array.
# Check if the two substrings array (for str1 and str2) have any substrings in common.
#   - Iterate through substrings1. for each substring of str1:
#     - If any substring in str1 is included in str2's substrings, return true; otherwise false

def substring_test(str1, str2)
  substrings1 = multichar_substrings(str1.downcase)
  substrings2 = multichar_substrings(str2.downcase)
  
  # substrings1.any? { |substr| substrings2.include?(substr) }
  (substrings1 & substrings2).any?
end

def multichar_substrings(str)
  substrings = []
  str.chars.each_index do |index|
    length = 2
    until length > str.length - index
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