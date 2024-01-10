# Longest Vowel Chain
# The vowel substrings in the string 'codewarriors' are 'o', 'e', 'a', and 'io'.
#   Of these vowel substrings, the longest has a length of 2.
# Given a string consisting of alphabetic lowercase characters, with no spaces,
#   return the -length- (integer) of the longest vowel substring.

# Input: 
#   A String (lowercase only, no spaces)
# Output:
#   An integer representing the length of the longest vowel substring.

# Examples:
# longest_vowels("codewarriors") == 2
# longest_vowels("suoidea") == 3
# longest_vowels("iuuvgheaae") == 4
# longest_vowels("ultrarevolutionariees") == 3
# longest_vowels("strengthlessnesses") == 1
# longest_vowels("cuboideonavicuare") == 2
# longest_vowels("chrononhotonthuooaos") == 5
# longest_vowels("iiihoovaeaaaoougjyaw") == 8

# Data:
# The String given as input
# - Create an array of vowel substrings
# - Split string on consonants?
#   /[^aeiou]/ -> Split string on characters that are -NOT- vowels

# Algorithm:
# Given a string as input, str:
# Split str into an array of vowel substrings:
#   - Split on consonants (not vowels)
#   -> An array of vowel substrings
#   - Map over vowel substrings and transform each value to length, then
#     select the largest length.

def longest_vowels(str)
  vowel_substrings = str.split(/[^aeiou]/)
  vowel_substrings.max_by(&:length).length
end

p longest_vowels("codewarriors") == 2
p longest_vowels("suoidea") == 3
p longest_vowels("iuuvgheaae") == 4
p longest_vowels("ultrarevolutionariees") == 3
p longest_vowels("strengthlessnesses") == 1
p longest_vowels("cuboideonavicuare") == 2
p longest_vowels("chrononhotonthuooaos") == 5
p longest_vowels("iiihoovaeaaaoougjyaw") == 8