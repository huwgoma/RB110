# Title Case
# A String is considered to be in 'title case' if each word in the string is
# either capitalized (first letter uppercase), or considered an exception
# and entirely lowercase 
# - The first word is always capitalized

# Write a method that converts a string into title case
# - A list of minor words will be given as a string, with each word
#   separated by a space. 
# - Minor words should always be lowercase (Except for the first word in the
#   string which is always capitalized)
# - Ignore the case of the minor words string

# Input: A String (to be converted), and a string (optional) listing the minor
#   words 
# Output: A new String containing the same words as the input string, with
#   each word converted to titlecase
# - First word is always capitalized (first letter is uppercase, rest lowercase)
# - All other words are capitalized unless they are part of the minor words list

# Examples:
# title_case('') == ''
# title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
# title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
# title_case('the quick brown fox') == 'The Quick Brown Fox'

# Data:
# The String given as input (to be converted)
# - Split str into an array of words and transform each word
#   - If it's the first word, capitalize it
#   - Otherwise, if it's a minor word, downcase it
#   - Otherwise, capitalize
# The minor words String given as input
# - Ignore case when determining whether a word from the input string is 
#   part of the minor words (downcase both word and minor words)

# Algorithm:
# Given two Strings as input, str and minor_words:
# Split str into an array of words.
# (Transform) iterate over words (with index). For each word:
#   If index is 0 (first word), capitalize the current word
#   Otherwise - if word (downcase) is included in minor_words (downcase),
#     downcase the current word
#   Otherwise, capitalize the current word
# -> Array of transformed words
# Join array back into a string with space.

def title_case(str, minor_words = '')
  minor_words = minor_words.downcase.split
  
  str.split.map.with_index do |word, index|
    next word.capitalize if index.zero?
    minor_words.include?(word.downcase) ? word.downcase : word.capitalize
  end.join(' ')
end

p title_case('') == ''
p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
