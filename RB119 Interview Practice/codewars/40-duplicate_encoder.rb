# Duplicate Encoder
# Write a method that takes a string and returns a new string, where
#   each character is either '(' if the corresponding character appears only once,
#   or ')' if the character appears more than once.
# - Ignore capitalization when determining if a character is a duplicate.

# Input: A String
# Output: A new string with every character from the input string replaced:
#   - Opening bracket ( if the character appears only once, and 
#     closing bracket ) if the character appears more than once.

# Examples
# duplicate_encode("din") == "((("
# duplicate_encode("recede") == "()()()"
# duplicate_encode("Success") == ")())())"
# duplicate_encode("(( @") == "))(("

# Data:
# The String given as input
# - Convert to an array of characters 
# - Maybe create a hash of unique character counts?
#   -> Key: 'a' value: 2
#   - So when we iterate through characters we can just perform a hash lookup?

# Algorithm:
# Given a string as input, str:
# Create a hash of character counts:
# - Iterate over the characters of str and increment each char count by 1
# (Transform) Iterate over str's characters. For each character:
#   Return '(' if the count of that character (from hash) is 1
#   Return ')' if count from hash is greater than 1
# -> Array of transformed strings ()
# - Join array back into a string

def duplicate_encode(str)
  chars = str.downcase.chars
  char_counts = chars.each_with_object(Hash.new(0)) do |char, counts|
    counts[char] += 1
  end
  
  chars.map do |char|
    char_counts[char] > 1 ? ')' : '('
  end.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
