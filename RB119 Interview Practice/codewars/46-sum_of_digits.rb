# Sum of Digits/Digital Root
# A digital root is the recursive sum of all digits in a number.
# Given an integer n, calculate the sum of the digits of n.
# - If the resulting sum has more than one digit, continue reducing in this way
#   until the digit sum is a single-digit number.
# - Assume the input will be a non-negative integer.

# Input: An Integer
# Output: Another Integer
# - Represents the 'digital root' of the given integer;
# - Obtained by summing the integer's digits and repeating until the sum is a 
#   single-digit number.

# Examples:
# digital_root(16) == 7   # 16 -> 1+6 -> 7
# digital_root(942) == 6  # 9+4+2 -> 15 -> 1+5 -> 6
# digital_root(132189) == 6
# digital_root(493193) == 2

# Data:
# The Integer given as input
# - Create an array of the integer's digits
# - Calculate the sum of the digits
# - Reassign `int` to the sum.
#   - If sum has more than one digit, repeat.

# Algorithm:
# Given an integer as input, `int`:
# Create an array of `int`'s digits
# Initialize a loop; until `int` only has one digit:
#   Calculate the sum of digits and reassign `int` to the result
#   Exit iteration when int only has one digit
# Return int

def digital_root(int)
  int = int.digits.sum until int.to_s.size == 1
  int
end

p digital_root(16) == 7   # 16 -> 1+6 -> 7
p digital_root(942) == 6  # 9+4+2 -> 15 -> 1+5 -> 6
p digital_root(132189) == 6
p digital_root(493193) == 2