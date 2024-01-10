# Alphabetized
# Reorder the characters of a string so that they are concatenated into a 
#   new string: case-insensitive, alphabetical order (a->z)
# - Whitespace and punctuation should be removed
# - Assume the input will only contain alphabetical letters, whitespace, and 
#   punctuation (so no numbers)

# Input: A String
# Output: A new string
# - Alphabetical characters from the original string should be sorted in 
#   ascending order (case-insensitive)

# Examples:
# alphabetized('') == ''
# alphabetized(' ') == ''
# alphabetized(' a') == 'a'
# alphabetized('a ') == 'a'
# alphabetized(' a ') == 'a'
# alphabetized('A b B a') == 'AabB'
# alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
# alphabetized("!@$%^&*()_+=-`,") == ""
# alphabetized("The Holy Bible") == "BbeehHilloTy"
# alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

# Data:
# The String given as input
# - Remove all non-alphabetical characters 
# - Split remaining string into an array of characters (letters only)
# - Sort array of characters by character.downcase (sort by lowercase)
# - Join array back into a string

# Algorithm:
# Given a string as input, str:
# Split str into an array of its characters.
# Define an array of the alphabet (A-Z and a-z)
# Select all characters from `characters` that are alphabetical.
# Sort the remaining characters by the downcased result of each character 
# -> Array of sorted characters (a->z, case-insensitive)
# Join array back into a string

ALPHABET = Array('a'..'z') + Array('A'..'Z')

def alphabetized(str)
  letters = str.chars.select { |chr| ALPHABET.include?(chr) }
  letters.sort_by(&:downcase).join
end


p alphabetized('') == ''
p alphabetized(' ') == ''
p alphabetized(' a') == 'a'
p alphabetized('a ') == 'a'
p alphabetized(' a ') == 'a'
p alphabetized('A b B a') == 'AabB'
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"