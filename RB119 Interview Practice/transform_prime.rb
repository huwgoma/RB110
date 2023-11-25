# Transform to Prime
# Given an array of integers, find the minumum number that can be inserted into
#   the array, such that the sum of integers (including the min number) should 
#   equal the next-closest prime number (from the original sum)
# - Assume the array will contain at least 2 elements
# - Assume the array will only contain positive integers
# - Numbers can repeat
# - The sum of the updated list should equal the closest (++) prime number

# Input: An Array of integers (at least 2, positive, duplicates possible)
# Output: An integer 
# - Representing the smallest number that can be added to the sum of integers
#   to produce the next-closest prime number 
#   (0 if the sum is already a prime)

# Examples:
# p minimum_number([3,1,2]) == 1
# p minimum_number([5,2]) == 0
# p minimum_number([1,1,1]) == 0
# p minimum_number([2,12,8,4,6]) == 5
# p minimum_number([50,39,49,6,17,28]) == 2

# Data:
# The array of integers given as input
# - Calculate the sum
# - Calculate whether the sum is already a prime
# - If not, calculate the next-largest prime number
# - Then calculate the diff between next prime and current sum

# Algorithm:
# Given an array of integers, integers:
# Calculate the sum of integers.
# Calculate the closest prime number.
#   Given an integer, int:
#     If int is already prime, return int.
#       A number is prime if it is only divisible by itself and 1.
#       If none of the numbers between 2 and n (exclusive) divide cleanly, it's 
#         a prime 
#     Otherwise, calculate the next-closest prime number
#       Increment the number by 1 and check if it's prime
# Take the difference between closest prime number and sum of integers
# -> Answer will be the minimum number for prime

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
  (2...int).none? { |i| (int % i).zero? }
end



p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2