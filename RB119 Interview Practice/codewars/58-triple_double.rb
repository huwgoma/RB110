# Triple Double
# Write a method that takes 2 numbers (num1, num2) and returns 1 if there is a 
#   straight triple of a number at any place in num1, and also a straight double
#   of the same number in num2.
# - If no such pattern exists, return 0 instead.

# Input: Two integers, num1 and num2
# Output: An integer, 0 or 1
# - 1: If num1 contains 3 consecutive identical digits, AND num2 contains 
#      2 consecutive identical digits of the same number
# - 0 otherwise

# Examples:
# triple_double(451999277, 41177722899) == 1
# # num1 has straight triple 999s and  num2 has straight double 99s
# triple_double(1222345, 12345) == 0
# # num1 has straight triple 2s but num2 has only a single 2
# triple_double(12345, 12345) == 0
# triple_double(666789, 12345667) == 1

# triple_double(6667779, 12345677) == 1
#   666 is not matched in num2, but 777 is matched by 77.


# Data:
# The two integers given as input
# - Create an array of all 3-digit numbers from num1
#   => Select all 3 digit numbers that are a straight triple (ie. same digit x3)
# - Iterate through straight triples. For each triple:
#   - Check if num2 contains a double version of that triple 
#     eg. 999 - check if num2 contains 99
# - If any triple has a matching double in num2, return 1
# - Otherwise, return 0 at the end of iteration

# Algorithm:
# Given two integers as input, num1 and num2:
# Create an array of all triples (3 identical numbers in a row)
# - How to deal with 000? - Leave the elements as strings?
#   - Convert num1 to string.
#   Iterate over each index of str_num. For each index:
#   - Take a 3-character slice from str_num, starting from index.
#   - Add the 3-char-slice to triples [] if all characters are identical
#     - THe unique version of the 3 char-slice should only be 1 character
#       => Means all digits are identical
#   Exit iteration when index exceeds string length - 3.


# Iterate through triples. For each triple:
#   Create a double using the same digits as the current triple
#   Check if num2 includes that double (string)
#   - Return 1 if true
# - Return 0


def triple_double(num1, num2)
  triples = triples(num1)
  triples.each do |triple|
    double = triple[0] * 2
    return 1 if num2.to_s.include?(double)
  end
  0 
end

def triples(num)
  triples = []
  str_num = num.to_s

  str_num.chars.each_index do |index|
    three_digits = str_num[index, 3]
    triples << three_digits if three_digits.chars.uniq.size == 1

    break if index >= str_num.length - 3
  end
  triples
end


p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(6667779, 12345677) == 1