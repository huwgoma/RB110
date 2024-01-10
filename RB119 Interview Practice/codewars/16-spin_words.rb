# Stop Spinning My Words!
# Write a method that takes a string and returns a new String with the same
#   contents, but with all 5+ character words reversed. 
# - Assume that the given string will only contain letters and spaces
# - Assume that spaces will only be included when more than one word is present

# Input: A String
# Output: A new string, with all 'words' that are 5 or mroe characters long
#   reversed
# - Words are space-separated.

# Examples:
# spin_words( "Hey fellow warriors" ) == "Hey wollef sroirraw" 
# spin_words( "This is a test") == "This is a test" 
# spin_words( "This is another test" ) == "This is rehtona test"
# spin_words("Welcome") == "emocleW"
# spin_words("Hey fellow warriors") == "Hey wollef sroirraw"

# Data:
# The String given as input
# - Split into an array of words (split on spaces)
# - (Transform) Iterate through words and reverse any words that are 5+ characters

# Algorithm:
# Given a string as input, str:
# Split str into an array of words on spaces.
# (Transform) Iterate through words. For each word:
#   If word length is greater than/equal to 5, return word reversed
#   Otherwise return word
# -> Array of words (5+ char words reversed)
# - Join words back together with a space.

def spin_words(str)
  str.split.map do |word|
    word.length >= 5 ? word.reverse : word
  end.join(' ')
end

p spin_words( "Hey fellow warriors" ) == "Hey wollef sroirraw" 
p spin_words( "This is a test") == "This is a test" 
p spin_words( "This is another test" ) == "This is rehtona test"
p spin_words("Welcome") == "emocleW"
p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"