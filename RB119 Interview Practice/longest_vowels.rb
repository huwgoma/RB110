# Longest Vowel Chain
# The vowel substrings in the word 'codewarriors' are o, e, a, and io.
# The longest vowel substring here has a length of 2.
# Given a lowercase string that contains only alphabetic characters and no spaces,
# return the length of the longest vowel substring.
# - Vowels: aeiou

# Input: A String
# - Assume it only contains lowercase alphabetic characters, no spaces
# Output: An integer
# - Representing the length of the longest substring that consists of vowels only

# Examples:
# longest_vowels("codewarriors") == 2
# longest_vowels("suoidea") == 3
# longest_vowels("iuuvgheaae") == 4
# longest_vowels("ultrarevolutionariees") == 3
# longest_vowels("strengthlessnesses") == 1
# longest_vowels("cuboideonavicuare") == 2
# longest_vowels("chrononhotonthuooaos") == 5
# longest_vowels("iiihoovaeaaaoougjyaw") == 8

# Data: The string given as input
# - Create an array of the vowel substrings within the string

# Algorithm:
# Given a string as input, str:
# Create an array of all vowel substrings within str:
#   Iterate over each index of str. For each index:
#     Initialize a loop, from 1 up to <string length - index>. For each iteration:
#       Create a substring of str, starting from the current index, and taking
#         <length> # of characters.
#       If the substring's characters are all VOWELS, add it to the vowel_substrings
#         array
#       Otherwise, skip to the next index.
# Find the vowel substring with the greatest length and return its length (int)

def longest_vowels(str)
  vowel_substrings = vowel_substrings(str)
  vowel_substrings.max_by(&:length).length
end

VOWELS = %w[a e i o u]

def vowel_substrings(str)
  vowels = []
  str.chars.each_index do |index|
    1.upto(str.length - index) do |length|
      substring = str.slice(index, length)
      break unless substring.chars.all? { |char| VOWELS.include?(char) }
      vowels << substring
    end
  end
  vowels
end


p longest_vowels("codewarriors") == 2
p longest_vowels("suoidea") == 3
p longest_vowels("iuuvgheaae") == 4
p longest_vowels("ultrarevolutionariees") == 3
p longest_vowels("strengthlessnesses") == 1
p longest_vowels("cuboideonavicuare") == 2
p longest_vowels("chrononhotonthuooaos") == 5
p longest_vowels("iiihoovaeaaaoougjyaw") == 8
