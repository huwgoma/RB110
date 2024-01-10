# Kebabize
# Write a method that takes a string in camelCase and returns a new 
#   String in kebab-case
# kebab-case:
# - Only contain lowercase letters
# - Non-alphabetic letters are ignored

# - Splitting the string into 'words' based on capital letters;
#   - Split string wherever there is a capital letter.
#   - Insert a '-' between words -> kebab case

# Input: A String (in camelCase)
# Output: A new String (in kebab-case)
# - Only lowercase
# - Words (split on uppercase letters) are separated with '-' hyphen
#   # Do not get rid of the split marker though
#   - Might have to manually split?

# Examples:
# kebabize('myCamelCasedString') == 'my-camel-cased-string'
# kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
# kebabize('CAMEL') == 'c-a-m-e-l' 

# Data:
# The String given as input 
# ? Maybe? 
#   - Iterate through characters 
#     - If current character is non-alphabetic, skip 
#     - If current character is uppercase, prepend hyphen '-' and lowercase
#       version of current character to output string
#     - Otherwise, add current character to output.
# Build a new string and return it

# Algorithm:
# Given a string as input, str:
# Initialize a new string, kebab = ''
# Iterate over each character of str. For each character:
#   - If current character is non-alphabetic, skip to next
#   - Otherwise, if current character is uppercase (A-Z), add 
#     '-' + character.downcase to kebab
#   - Otherwise, if current character is lowercase (a-z), add character
#     to kebab.
# Return kebab

UPPERCASE = Array('A'..'Z')
LOWERCASE = Array('a'..'z')
ALPHABET = UPPERCASE + LOWERCASE

def kebabize(str)
  str = standardize_camelcase(str)

  str.chars.each_with_object('') do |char, kebab|
    char = "-#{char.downcase}" if UPPERCASE.include?(char)
    kebab << char
  end
end

def standardize_camelcase(str)
  # Remove all non-alphabetic characters and downcase the first character
  # str = str.chars.select { |char| ALPHABET.include?(char) }.join
  str = str.delete('^A-Za-z')
  str[0].downcase + str[1..-1]
end


p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'
p kebabize('camelCaseIsAA') == 'camel-case-is-a-a'

# Weird Tests
p kebabize('CamelCase') == 'camel-case'
p kebabize('CAMEL') == 'c-a-m-e-l' 
p kebabize('21VgHj') == 'vg-hj'