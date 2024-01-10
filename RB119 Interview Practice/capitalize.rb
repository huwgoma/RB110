# Capitalize
# Write a method capitalize that takes a string and returns a new string (?)
#   containing the following modifications:
# - All words that are followed by a vowel-starting word should be capitalized 
#   (ie. first letter uppercase)
# - Do not use #capitalize.

# Input: A String
# Output: A new String
# - Contains the same contents as the input string, but each word that is followed
#   by a vowel-starting word will have its first character uppercased

# Examples:
# puts capitalize("hello apple world") # "Hello apple world"
# puts capitalize("this is an umbrella") # "This Is An umbrella"
# puts capitalize("every vowel starts an echo") # "every vowel Starts An echo"
# puts capitalize("under the oak tree") # "under The oak tree"
# puts capitalize("a quick brown fox") # "a quick brown fox"

# Data:
# The string given as input
# - Split into an array of words (on spaces)
# - For each word, look ahead at the next word and check if the next word starts with
#   a vowel
#   - If it does, capitalize the word
#   - Otherwise dont
# - How to deal with the last word? break if next word is nil

# Algorithm:
# Given a string as input, str:
# Split str into an array of words.
# (transform) Iterate over words with index. For each word:
#   Retrieve the next word (at index + 1)
#   - If next_word is nil, break iteration (nil just means we are at the last word)
#   If the next word starts with a vowel (aeiou  (AEIOU?)):
#     Destructively upcase the first character of the current word
#   Return the current word (mutated if next word starts w/ vowel; otherwise, the same word unmodified)
# -> An array of words, with some words mutated (those before vowel words)
# Join words back together with space.

VOWELS = ['a', 'e', 'i', 'o', 'u']

def capitalize(str)
  words = str.split
  words.map.with_index do |word, index|
    next_word = words[index + 1]
    break if next_word.nil?

    word[0] = word[0].upcase if next_word.start_with?(*VOWELS)
    word
  end
  words.join(' ')
end


puts capitalize("hello apple world") # "Hello apple world"
puts capitalize("this is an umbrella") # "This Is An umbrella"
puts capitalize("every vowel starts an echo") # "every vowel Starts An echo"
puts capitalize("under the oak tree") # "under The oak tree"
puts capitalize("a quick brown fox") # "a quick brown fox"