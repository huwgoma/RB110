# To Weird Case
# Write a method named to_weird_case that accepts a string and returns the 
#   same sequence of characters, but with every 2nd character in every 3rd word
#   converted to uppercase. All other characters should remain the same.

# Input: A String
# Output: A new string
# - In every 3rd word, every 2nd character is converted to uppercase
# - Word: Any sequence of non-space characters (ie. words are space-separated)

# Examples:
# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'

# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# 'a' is the 3rd word but only one character - only every SECOND character
# should be upcased

# p to_weird_case('aaA bB c') == 'aaA bB c'
#   same here

# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'


# Data:
# The String given as input
# - Probably split the string on spaces into an array of words

# Algorithm:
# Given a string, str:
# Split str into an array of words on spaces
# Iterate through words with index. For each word:
#   If the index of the current word is divisible by 3:
#     Split the current word into its characters. 
#     (transform) Iterate through characters with index. For each character:
#       If the index of current character is odd, upcase the current character
#     => Join transformed characters back together into a word
# => Join transformed words back together into a sentence (with spaces)

# def to_weird_case(str)
#   str.split.map.with_index do |word, index|
#     if (index + 1) % 3 == 0
#       word.chars.map.with_index do |char, index|
#         index.odd? ? char.upcase : char
#       end.join
#     else
#       word
#     end
#   end.join(' ')
# end

def to_weird_case(str)
  str.split.map.with_index do |word, index|
    if (index + 1) % 3 == 0
      i = 0
      while i < word.size
        word[i] = word[i].upcase if i.odd?
        i += 1
      end
    end
    word
  end.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'