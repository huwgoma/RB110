# Minimum Sum
# Write a method that takes one argument: An array of integers.
# The method should return the minimum sum of 5 consecutive numbers in the 
#   given array.
# - If the array has less than 5 elements, return nil.

# Input: An array of integers
# Output: An integer
# - Representing the lowest-possible sum of 5 consecutive numbers
# - nil if array contains less than 5 numbers

# Examples:
# p minimum_sum([1, 2, 3, 4]) == nil
# - less than 5 elements -> nil

# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# -> 1+2+3+4+5 -> 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# -> 2 + 6 + 5 + 1 + 2 -> 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# Data:
# - The array of integers given as input
# Might need to create subarrays of 5 consecutive elements
# - A nested array containing all possible permutations of 5-consecutive elements
# eg. [1, 2, 3, 4, 5, 6] => [1, 2, 3, 4, 5], [2, 3, 4, 5, 6]
# eg. [1, 2, 3, 4, 5, 6, 7] => [1, 2, 3, 4, 5], [2, 3, 4, 5, 6], [3, 4, 5, 6, 7]

# Algorithm:
# Given an array of integers, integers:
# Create a nested array of 5-consecutive-element subarrays:
#   Iterate n times, where n is equal to the array size - 4 (index - 5)
#   For each iteration, i = 0
#     Create a subarray from integers, starting at index i, for 5 elements.
#     Add the subarray to subarrays []
# Iterate through each 5-consecutive-element subarray and transform: 
#   Calculate the sum of each subarray
# Find the smallest sum and return that.

def minimum_sum(integers)
  sums = []
  (integers.size - 4).times do |index|
    sums << integers[index, 5].sum
  end
  
  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10