# Palindrome Substrings
# Given a string, write a method `palindrome_substrings`, which returns
# all the substrings from a given string that are palindromes.
#   For this problem, palindrome words are case-sensitive.

# Input: String
# Output: Returns an Array containing all substrings from the input String that 
#         are palindromic 
#   A palindrome is a String that has the same value both forward and backward.
# Rules:
#   - Palindromes are case-sensitive. eg. Mom != moM
#   - Allowed to assume that the input will always be a String?
#   - Substrings have a min length of 2. Otherwise all single character substrings
#     would be considered palindromic.
#   - Do not mutate the input String.

# Examples:
#   palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
#   palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
#   palindrome_substrings("palindrome") == []
#   palindrome_substrings("") == []

# Data:
#   Array (Return value is an Array, so add substrings to Array conditionally)

# Algorithm:
# Given an input String, str:
#   Initialize an empty array, palindromes = []
#   Split str into an Array of all its substrings.
#     * Substrings must be at least 2 characters long.
#     eg. str = 'halo'; substrings = [ha, hal, halo, al, alo, lo]
#   Iterate over the substrings Array. For each substring:
#     If the current substring is a palindrome (substring == substring.reverse),
#     add it to the palindromes array.
#   Return the palindromes array.


# split_substrings
# Input: String
# Output: Returns an Array of ALL substrings in the input String.
# Rules: 
#   Substring Length?
#     - Min length of 2 -> Skip the last letter (because it will only ever be 1)
#     - Starting from any given index (except the last one), 
#       create substrings that are incrementally one character longer,
#       until the ending index is reached.
#       - So for a String of length 4 (Starting Index 0-3, iterate only 0-2): 
#         - Starting Index 0: 0-1, 0-2, 0-3 (Length 2-3-4)
#         - Starting Index 1: 1-2, 1-3 (Length 2-3)
#         - Starting Index 2: 2-3 (Length 2)

# Example:
#   split_substrings('halo') == ['ha', 'hal', 'halo', 'al', 'alo', 'lo']

# Algorithm:
#   Given an input String, str:
#   Initialize an empty array substrings = []
#   Iterate over each index of str, starting from 0, excluding the last index.
#   For each index, i = 0 = 1 = 2:
#     Initialize a variable length = 2
#     Initialize a variable max_length = str's length - current starting index (i)
#     Initialize a loop. While length is less than/equal to max length: 
#       From the current starting index (i), retrieve a substring of length (2).
#       Add substring to substrings array.
#       Increment length by 1.
#   Return substrings.


# Code:
def palindrome_substrings(str)
  palindromes = []
  substrings = split_substrings(str)
  substrings.each { |substr| palindromes << substr if palindrome?(substr) }
  palindromes
end

def palindrome?(str)
  str == str.reverse
end

def split_substrings(str)
  substrings = []
  0.upto(str.length - 2) do |index|
    substr_length = 2 
    max_length = str.length - index
    
    while substr_length <= max_length
      substrings << str.slice(index, substr_length)
      substr_length += 1
    end
  end
  substrings
end

puts palindrome_substrings('halo') == []
puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []
