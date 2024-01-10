# Mean Square Error
# Write a method that accepts two arrays of integers of equal length,
#   -compares the value of each integer to the corresponding integer in the 
#     other array,
#   - squares the absolute value difference between those two values, 
#   - then returns the average of those squared absolute value differences between
#     each integer pair

# Input: Two Arrays of integers
# Output: A single number, obtained by:
#   - Iterating through each integer of arr1
#   - Finding the difference between arr1's integer and arr2's integer (at the 
#     same index)
#   - Squaring that difference
#   - Repeating the process for all integers, then calculating the average of
#     squared differences

# Examples:
# [10, 20, 10, 2], [10, 25, 5, -2]
# 10 and 10 -> Difference is 0 -> Squared Difference is 0
# 20 and 25 -> Difference is 5 -> Squared Difference is 25
# 10 and 5 -> Difference is 5 -> Squared Difference is 25
# 2 and -2 -> Difference is 4 -> Squared Difference is 16
# Average of 0/25/25/16 is 16.5

# Data:
# The two arrays given as input 
# - Assume both arrays are the same size
# - (Transform) Iterate through arr1.
#   - Calculate the difference between the current int of arr1 and the 
#     corresponding int of arr2
#   - Square the difference (absolute)
# - Sum the squared differences and then divide by arr1 size (float div)

# Algorithm:
# Given two arrays of integers as input, arr1 and arr2:
# (Transform) Iterate through arr1 with index. For each integer of arr1, int1:
#   Calculate the difference between int1 and the integer at arr2[index]
#   - Absolute value only
#   Square the difference
# -> Array of squared differences
# Sum the squared differences and divide (float) by arr1 size

def mean_square_difference(arr1, arr2)
  squared_differences = arr1.map.with_index do |int1, index|
    (int1 - arr2[index]).abs ** 2
  end
  squared_differences.sum.fdiv(arr1.size)
end

p mean_square_difference([1, 2, 3], [4, 5, 6]) == 9
p mean_square_difference([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p mean_square_difference([-1, 0], [0, -1]) == 1

