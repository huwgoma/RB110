# Most Frequently Used Words in Text
# Write a method that takes a string of text (possibly including punctuation and
#   line breaks) and returns an array of the 3 most frequent words, in descending
#   order.

# Assumptions/Rules:
# - A word is a string of letters (a->z), optionally containing one or more 
#   apostrophes
# - Apostrophes can appear at the start/middle/end of a word 
#   eg. 'abc, abc', 'abc', ab'c are all valid
# - Any other characters (#, /, |, ...) are not part of words, and should be 
#   treated as whitepsace
# - Word matches are case-insensitive (the words in the returned array should be
#   lowercase)


# Input: A String
# Output: An array of the 3 most frequent words in the string (descending order)
# - If the given string contains fewer than 3 unique words, return the top 0/1/2
#   words

# Examples:
# top_3_word("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
#   => [e (7), ddd(5), aa(3)]
# top_3_word("  //wont won't won't")
#   => [won't(2), wont(1)]

# Data:
# The string given as input
# - Split string into an array of words
# - Clean up each word (remove punctuation except apostrophes)
# - Iterate through words and store frequencies in a hash?
#   - Then sort hash by value and pick out the top 3?
# The array of the top 3 words in the given string

# Algorithm:
# Given a string as input, str:
# Split string into an array of words.
# Initialize a frequency hash, freq = Hash.new(0)
# Iterate through words. For each word:
#   Clean up the word; remove all non a-z or ' characters
#   Increment the frequency of the corresponding word in word_freq hash by 1
# Should have a hash of word frequencies, { 'word' => 3 }
# - Find the 3 largest key-value pairs (by value), then return the keys in an array

def top_3_words(str)
  word_frequency = Hash.new(0)
  str.downcase.split.each do |word|
    word.gsub!(/[^a-z']/, '')
    next if word.gsub("'", '').empty?
    word_frequency[word] += 1
  end
  word_frequency.max_by(3) { |_word, freq| freq }.to_h.keys
end


p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]

# PEDAC the bug 
p top_3_words("  , e   .. ") == ["e"]

p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []

p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]
