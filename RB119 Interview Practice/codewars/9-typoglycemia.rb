require 'pry'
# Typoglycemia Generator
# Write a method that takes a string and returns a new string, with the following
# modifications:
# - The first and last characters of each word (space-separated) remain in their
#   original places
# - Characters BETWEEN (exclusive) the first and last characters are sorted 
#   alphabetically
# - Punctuation should remain in the same place 
#   eg. shan't => sahn't

# Input: A String
# Output: A new string, where each word's characters are sorted alphabetically,
#   excluding the first and last alphabetic letters.
#   - Also excludes punctuation
# - Words are space-separated
# - Punctuation (- ' , .) does not count as a first/last character
#   eg. -dcba => -dbca, not -bcda

# Examples:
# scramble_words('professionals') == 'paefilnoorsss'
# scramble_words('i') == 'i'
# scramble_words('') == ''
# scramble_words('me') == 'me',
# scramble_words('you') == 'you', 
# scramble_words('card-carrying') == 'caac-dinrrryg'
# scramble_words("shan't") == "sahn't"
# scramble_words('-dcba') == '-dbca'
# scramble_words('dcba.') == 'dbca.'
# scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

# Data:
# The string given as input
# - Split string into an array of words (split on spaces)
# - For each word:
#   - Extract the start and the end (take punctuation into account; slice until
#     an alphabetic character is encountered)
#   - Sort the remaining characters
#   - Concatenate start and end back to the sorted characters
# The string we will build and return as output

# Algorithm:
# Given a string as input, str:
# Split str into an array of words (on spaces).
# (transform) Iterate over words. For each word:
#   Extract the middle portion of the string (ie. the portion we want to sort)
#   - Remove (destructively) the start of the string:
#     - Start from index 0 (first character) - if first char is alphabetic, slice
#       from index 0 to index.
#     - If first char is not alphabetic, increment index and try again until a 
#       alphabetic character is retrieved, then slice from index 0 - index
#   - Remove the end of the string:
#     - Start from index -1 (last char); if index -1 is not alphabetic, decrement
#       index by 1 and try again.
#   Sort the middle portion of the string:

#   - Create a copy of the string with all punctuation deleted
#   - Sort the copy string (alphabetical only)
#   - Iterate through the characters of the word. For each char:
#     - If char is a punctuation, skip to next
#     - Otherwise, remove the first character from the sorted characters and
#       replace the current character with that character.



#   => A sorted array of characters of the middle portion of string (punctuation
#      untouched)
# Build the output string:
# - start_string + middle.join + end_string => word
# => An array of transformed words; join back together with space (' ')


PUNCTUATION = ['-', "'", ',', '.']

def scramble_words(str)
  str.split.map do |word|
    next word if word.length <= 2
    word_start = word.slice!(0..word.index(/[a-zA-Z]/))
    word_end = word.slice!(word.rindex(/[a-zA-Z]/)..-1)
    sorted_letters = word.delete(PUNCTUATION.join).chars.sort
    
    word.chars.each_with_index do |char, index|
      next if PUNCTUATION.include?(char)
      word[index] = sorted_letters.shift
    end

    word_start + word + word_end
  end.join(' ')
end


p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you' 
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'

p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
