# Multiples of 3 or 5
# If we list all natural numbers below 10 that are multiples of 3 OR 5, we will
#   get 3, 5, 6, and 9. The sum of these numbers is 23.

# Write a method that returns the sum of all multiples of 3 or 5 BELOW the
# given integer.
# - If the given integer is negative, return 0.
# - If a number is a multiple of both 3 and 5, only count it once.
#   eg. 17: 3, 5, 6, 9, 10, 12, 15 (15 is only counted once)

# Input: An Integer 
# - Represents the number to stop at (exclusive ie. numbers must be LESS THAN n)
# Output: Also an integer
# - Represents the sum of all numbers below n that are divisible by 3 or 5 or both.

# Examples:
# sum_of_multiples(10) == 23
# sum_of_multiples(18) == 60 # (18 is not counted, and 15 only once)
# sum_of_multiples(20) == 78
# sum_of_multiples(200) == 9168

# Data:
# The integer given as input
# - Probably loop from 1 up to the given number (exclusive)
# A sum variable to keep track of the sum

# Algorithm:
# Given an integer as input, n:
# Initialize a new variable, sum = 0
# Loop from 1 to n, excluding n. For each number:
#   If the number is divisible by either 3 or 5, increment sum by number
#   Otherwise go next
# Return sum

def sum_of_multiples(n)
  sum = 0
  (1...n).each do |num|
    sum += num if (num % 3).zero? || (num % 5).zero?
  end
  sum
end

p sum_of_multiples(10) == 23
p sum_of_multiples(18) == 60 # (18 is not counted, and 15 only once)
p sum_of_multiples(20) == 78
p sum_of_multiples(200) == 9168
