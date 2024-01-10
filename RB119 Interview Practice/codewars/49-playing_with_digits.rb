# Playing with Digits
# Given two positive integers, `num` and `power`:
# Find a positive INTEGER `k` (if it exists), such that the sum of `num`'s 
#   digits raised to consecutive powers, starting from `power`, is equal to 
#   k * `num`

# ie. (a^power + b^power+1 + c^power+3 + ...) = num * k
# If k exists, return k; otherwise, return -1.
# Assume that num and power will always be positive.

# Input: Two integers, `num` and `power`
#   - Raise the digits of `num` to consecutive powers starting from `power`, then
#     add them
# Output: 
#   - Divide the sum of raised digits by `num` and see if the quotient is a 
#     integer (clean division) => This number is `k`
#   - If k exists, return k; otherwise, return -1

# Examples:
# dig_pow(89, 1) == 1

# dig_pow(92, 1) == -1
#   9**1 + 2**2 => 13; 92 * k == 13 ? no such integer => -1
# dig_pow(695, 2) == 2
#   6^2 + 9^3 + 5^4 => 1390; 1390 /695 => 2

# dig_pow(46288, 3) == 51


# Data:
# The two integers given as input, num and power
# - Split num into an array of its digits
# - Calculate the digit power sum (iterate through digits (reverse) and 
#   raise each digit to power + some number (0++)), then sum the raised digits

# Algorithm:
# Given two integers as input, num and power:
# Split num into an array of its digits.
# (Transform) iterate through digits (1s first). For each digit:
#   Raise the current digit to power
#   Increment power by 1
#   Return raised digit
# => An array of raised digits
# Calculate the sum of raised digits
# Is there an integer k for which the sum of raised digits is equal to k * n?
# - Divide the sum of raised digits by `num` (float division)
# - If the float quotient is equal to the quotient converted to an integer,
#   return k
#   Otherwise return -1.

def dig_pow(num, power)
  raised_digit_sum = num.digits.reverse.map do |digit|
    power += 1
    digit ** (power - 1)
  end.sum

  quotient = raised_digit_sum.fdiv(num)
  quotient == quotient.to_i ? quotient.to_i : -1
end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1 #9**1 + 2**2 => 13; 92 * k == 13 ? no such integer => -1
p dig_pow(695, 2) == 2 #6^2 + 9^3 + 5^4 => 1390; 1390 /695 => 2
p dig_pow(46288, 3) == 51