# Write a function, snakecase, that transforms each word in a sentence to alternate 
# between lower (even index value) and upper (odd index value) cases when the word 
# before or after it  begins with "s".

# Input: A String (sentence with words; words space-separated)
# Output: A new string
# - For each word, if the word before or after the current word starts with 's' (or 'S'?)
#   modify the current word into sNaKeCaSe (start with lowercase and alternate)

# Examples:
# puts snakecase("Snakes slither silently") # "sNaKeS sLiThEr sIlEnTlY"
# puts snakecase("simple sentence structure") # "sImPlE sEnTeNcE sTrUcTuRe"
# puts snakecase("apples are sweet") # "apples aRe sweet"
# puts snakecase("swiftly swimming swans") # "sWiFtLy sWiMmInG sWaNs"
# puts snakecase("the sun sets slowly") # "tHe sUn sEtS sLoWlY"
# puts snakecase("A quick brown fox") # "A quick brown fox"

# Data:
# The string given as input
# - Split into an array of words (on spaces)
# - Iterate through words with index. For each word:
#   - If either the word before or the word after starts with s, modify the current 
#     word to snakecase (transformation)
# - How to deal with the first (before) and last (after) words?
#   - set to empty str 

# Algorithm:
# Given a string as input, str:
# Split str into an array of words on spaces
# (Transform) Iterate through words with index. For each word:
#   Retrieve the word before and the word after (index - 1) and (index + 1)
#   - Before: If index == 0, set before to empty str
#   - After: Will be nil when we try to access index + 1 -> OOB index
#   If either the before word or after word starts with 's' or 'S', 
#     transform the current word into snakecase:
#     - Iterate through each character with index
#       - If index is even, downcase the current char
#       - If index is odd, upcase current character
#     -> Array of transformed chars -> Join into a word
#     Reassign word to the new word
#   Otherwise, do nothing
#   -> Return word
# -> Array of transformed words -> Join into string

def snakecase(str)
  words = str.split
  words.map.with_index do |word, index|
    before_word = index.zero? ? '' : words[index - 1]
    after_word = words.fetch(index + 1, '')

    if before_word.start_with?('s', 'S') || after_word.start_with?('s', 'S')
      word = word.chars.map.with_index do |char, index|
        index.even? ? char.downcase : char.upcase
      end.join
    end
    word
  end.join(' ')
end

puts snakecase("Snakes slither silently") # "sNaKeS sLiThEr sIlEnTlY"
puts snakecase("simple sentence structure") # "sImPlE sEnTeNcE sTrUcTuRe"
puts snakecase("apples are sweet") # "apples aRe sweet"
puts snakecase("swiftly swimming swans") # "sWiFtLy sWiMmInG sWaNs"
puts snakecase("the sun sets slowly") # "tHe sUn sEtS sLoWlY"
puts snakecase("A quick brown fox") # "A quick brown fox"
