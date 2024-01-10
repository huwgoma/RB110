# Multiples of 3 or 5
# If we list all natural numbers below 10 that are multiples of 3 or 5, 
#   we get 3, 5, 6, and 9.
# - The sum of these is 23.

# Write a method that takes an integer and returns the sum of all multiples of 3
#   or 5, BELOW the given integer.
# - If the given int is negative, return 0.
# - If a number is a multiple of both 3 and 5, count it only once

# Input: An Integer
# - Represents the number to loop up to (exclusive)
# Output: AN integer 
# - The sum of all numbers between 1 and the given number that are divisible by 
#   either 3 or 5

# Examples:
# multiples(10) == 23 
# 3, 5, 6, 9 -> 23

# Data:
# The integer given as input 
# - Loop from 1 up to this integer (exclusive - 1...n)
# Create a variable to store the running sum
# - Iterate from 1 to int. for each number, if it is evenly divisible by 
#   3 or by 5, increment sum by that number
# return sum

# Algorithm:
# Given an integer as input, int:
# Initialize a new variable, sum = 0
# Loop from 1 to int, exclusive. For each loop, i = 1++
#   Check if i is evenly divisible by either 3 or 5. 
#   If it is, increment sum by i
#   Otherwise do nothing
# Return sum

def multiple_sum(int)
  (1...int).select { |i| (i % 3).zero? || (i % 5).zero? }.reduce(:+)
end

p multiple_sum(10) == 23
p multiple_sum(20) == 78
p multiple_sum(200) == 9168