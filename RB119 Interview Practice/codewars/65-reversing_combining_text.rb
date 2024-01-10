# Reverse and Combine Text
# Write a method that takes a string and returns a new string containing the same
#   text, but reversed and combined(?)

# Input: A String containing space-separated words
# Rules:
# - If there is more than one word, reverse each word, then combine each pair 
#   of words into one
#   - If there is an odd number of words, reverse the last one, but leave it alone
# - Repeat until there is only one word
# Output: A new string containing the result of -repeatedly- reversing and combining
#   words, until there is only one word (no spaces)

# Examples:
# "abc def ghi 123" 
#   => [abc def ghi 123] - Reverse+Combine-> [cbafed, ihg321]
#   - Reverse+Combine -> [defabc123ghi] (1 word) -> defabc123ghi

# Data:
# The string given as input
# - Split into an array of words
# - Until words only has 1 element:
#   - Iterate through words 2 elements at a time 
#   - Reverse each element, then combine them (a.reverse + b.reverse)
# -> [oneword] -> Return the single string

# Algorithm:
# Given a string as input, containing space-separated words:
# Split str into an array of words (on spaces)
# Initialize a loop. Until words only has one word remaining:
#   Initialize a new empty array, working_words = []
#   Iterate through words, 2 words at a time. For each pair of words:
#     Reverse and combine the two words into one string
#     - If string b is nil, skip the combination step (but still reverse string a)
#     Add the resulting string to working words
#   Reassign words to working words array
# - Break when words size is 1
# Return the single string out of words

def reverse_and_combine_text(str)
  words = str.split
  until words.size == 1
    words = words.each_slice(2).with_object([]) do |(word1, word2), new_words|
      new_words << "#{word1.reverse}#{word2&.reverse}"
    end
  end
  words.first
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
