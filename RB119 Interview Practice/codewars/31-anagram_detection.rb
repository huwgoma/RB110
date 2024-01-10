# Anagram Detection
# An anagram is the result of rearranging a word's letters to produce a new word
# Write a method that takes two strings and returns a Boolean:
# - true if the two strings are anagrams
# - false otherwise.
# Anagrams should be case-insensitive

# Input: 
# - Two strings
# Output:
# - A boolean; true if the two strings contain the same letters (case-insensitive),
#   false otherwise.

# Examples:
# is_anagram?('Creative', 'Reactive') == true
# is_anagram?("foefet", "toffee") == true
# is_anagram?("Buckethead", "DeathCubeK") == true
# is_anagram?("Twoo", "WooT") == true
# is_anagram?("dumble", "bumble") == false
# is_anagram?("ound", "round") == false
# is_anagram?("apple", "pale") == false

# Data:
# The two strings given as input
# - Downcase each word (to normalize casing)
# - Split each word into an array of its characters
# - Sort the arrays of chars and compare for equality

# Algorithm:
# Given two strings as input, str1 and str2:
# Downcase both strings
# Split both strings into an array of their characters
# Sort both character arrays
# Compare the two sorted/downcased character arrays for equality
# - If the two words have the same letters and same occurrences of those letters,
#   the character arrays should be identical when sorted

def is_anagram?(str1, str2)
  str1.downcase.chars.sort == str2.downcase.chars.sort
end


p is_anagram?('Creative', 'Reactive') == true
p is_anagram?("foefet", "toffee") == true
p is_anagram?("Buckethead", "DeathCubeK") == true
p is_anagram?("Twoo", "WooT") == true
p is_anagram?("dumble", "bumble") == false
p is_anagram?("ound", "round") == false
p is_anagram?("apple", "pale") == false