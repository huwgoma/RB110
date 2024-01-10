# Transform to Prime
# Given an array of n integers, find the smallest number that can be inserted into 
#   the list, such that the sum of all elements equals the closest prime number.
# - The array will always contain at least 2 integers, and will only contain
#   positive integers
# - Array numbers may be duplicated

# Input: An array of integers
# Output: An integer 
# - Represents the number we need to add to the array of integers for the total
#   sum to be a prime number (the closest prime number to the existing sum)

# Examples:
# minimum_number([3, 1, 2]) == 1 # 3+1+2 = 6; closest prime is 7; +1 to reach 7
# minimum_number([5,2]) == 0
# minimum_number([1,1,1]) == 0
# minimum_number([2,12,8,4,6]) == 5
# minimum_number([50,39,49,6,17,28]) == 2

# Data:
# The array of integers given as input
# - Calculate the sum of integers
# - Calculate the closest prime number to integers sum
# - Calculate the difference between integers sum and closest prime (might be 0)

# Algorithm:
# Given an array of integers as input, integers:
# Calculate the sum of integers
# Calculate the closest prime number:
#   Given an integer as input, return an integer representing the closest prime
#     number (closest positively)
#   A prime number is a number that is only divisible by 1 and itself.
#     - Iterate from 2...number (exclusive). If none of the intermediate numbers 
#       can divide evenly against the given integer, return true (is prime)
#   - Until integer is prime, increment integer by 1
# Calculate the difference between the closest prime and the sum of integers

def minimum_number(integers)
  sum = integers.sum
  closest_prime = closest_prime(sum)
  closest_prime - sum
end

def closest_prime(int)
  int += 1 until prime?(int)
  int
end

def prime?(int)
  return false if int < 2
  (2...int).none? { |divisor| (int % divisor).zero? }
end

p minimum_number([3, 1, 2]) == 1 # 3+1+2 = 6; closest prime is 7; +1 to reach 7
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2