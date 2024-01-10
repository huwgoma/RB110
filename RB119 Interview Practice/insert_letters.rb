
# Write a method that takes a string as input and outputs the same String
# with the following modifications (mutate the input string ? either)

# After the first occurrence of each letter in the input string, insert 
#   all the alphabet letters that are not already in the given string,
#     and that come after the current letter we are inserting after 
#   Inserted letters should be in uppercase
# - Assume the original string's characters are all lowercase

# p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
# After h, insert I..Z (except for the characters that are already in 
#   the string (excluding l and o (and h/e but they dont come before h)))
# After L, insert M..Z, same rules as above
# After the second L, don't insert anything (because it is the second occurrence
#   of L in the original string)

# Input: 
#   A String 
# Output:
#   Another String (could be the same one mutated) with the following mods:
# - After the first occurence of each letter, capital letters from letter + 1
#   to Z are inserted, excluding any letters that are already in the String
# The input string will always contain a certain amount of lowercase letters
# (min 1 / max 50).

# Examples:
# p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
# p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
# p insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
# p insert_missing_letters("z") == "z"
# p insert_missing_letters("efgh") == "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"

# Data:
# The string given as input 
# - Probably iterate over each letter
# - Need some way to keep track of whether we've already seen that letter (is this
#   the first occurrence of this letter?) 
#   - Possibly a hash; keys are the letter and values are the running count
# Will need to build a string of the letters to be inserted
# - Iterating from the current letter + 1 to Z, adding the letter to the String
#   if the original string doesn't include that letter (account case)

# Algorithm:
# Given a string as input, str:
# Create a working alphabet set 
# - Create an array of the alphabet (lowercase)
# - Select all characters from ALPHABET that are not included in str. (reject chars in str)
# Create a character count hash { character: character_count (starting from 0) }
# (Transform) Iterate through each character of str. For each character:
# - Add +1 to the count of that character in char_counts.
# - If the corresponding value in char_counts exceeds 1, return the current character as-is.
# - Otherwise, apply the transformation:
#     - Build the string to be inserted behind the current character:
#       - Find all the characters from our working alphabet set that are AFTER the current char
#         - ie. After => All characters that are 'greater than' current char a < z
#       - Join those characters into a string, then convert to uppercase
#       - Concatenate the UPPERCASE CHARS to the current character
#     - Return the resulting string
#  => An array of transformed characters -> strings (chars + inserted string of chars)
# - Join the array back together.

ALPHABET = Array('a'..'z')

def insert_missing_letters(str)
  working_alphabet = ALPHABET.reject { |letter| str.include?(letter) }
  char_counts = Hash.new(0)
  str.chars.map do |char|
    char_counts[char] += 1
    next char if char_counts[char] > 1

    insert_str = working_alphabet.select { |letter| letter > char }.join.upcase
    char + insert_str
  end.join
end

p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
p insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
p insert_missing_letters("z") == "z"
p insert_missing_letters("efgh") == "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"