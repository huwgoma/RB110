# Decipher This!
# Given a secret message, decipher it:
# For each word:
# - The second and last letters are switched.
#   eg. 'Hello' -> 'Holle'
# - The first letter is replaced by its character code (eg. A becomes 65)

# Assume there are no special characters (just letters and spaces)

# Input: A String of words (space-separated)
# - Words are encoded according to the above rules
# Output: A String of words (also space-separated)
# - Each word is the result of deciphering the corresponding word from the input string

# Examples:
# '72olle 103doo 100ya'
# 72 -> 'H'; switch the second and last characters -> 'Hello'
# 103 -> 'g' -> good
# 100 -> 'd' -> day

# Data:
# The string given as input
# - Split string into an array of words on spaces
# For each word:
# - Separate the character code at the front from the rest of the string
#   - Slice while character is 0-9?
# - Swap the second (first if splitting first/rest) and last characters of the 
#   remaining string
# - join back together

# Algorithm:
# Given a string as input, str:
# Split str into an array of words.
# Transform - Iterate over words. For each word:
#   Separate the first letter (the numbers) and the rest of the string:
#   - Regex: /[0-9]+/ match one or more characters 0-9
#   - Because numbers appear at the front of the string in a group, we can match
#     for 1 or more characters 0-9 and slice them from the string
#   Convert the first letter to an integer, then to a string (using #chr)
#   Swap the first and last letters of the remainder of the string
#   Join first letter and string remainder together and return the result to #map
# -> Array of transformed words
# Join transformed words together with a space

def decipher_this(str)
  str.split.map do |word|
    first_letter = word.slice!(/[0-9]+/).to_i.chr
    word[0], word[-1] = word[-1], word[0] unless word.empty?
    first_letter + word
  end.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"



# sub [0-9]+