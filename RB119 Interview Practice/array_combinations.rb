# Array Combinations
# Write a method that takes an array of elements and an integer, and returns an array of 
#   all possible n-element combinations from the given array.

# Input: An array of elements, and an integer (n)
# Output: An array of subarrays, where each subarray contains one possible
#   n-element combination
# - If the given array has fewer elements than the given integer, return an empty array

# Examples:
# combination([1, 2, 3, 4], 3) == [[1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4]]
# combination([1, 2, 3, 4], 2) == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]

# combination([], 3) == []
# combination([1, 2, 3], 0) == [[]]

# Data:
# The array of elements given as input
# The integer given as input.
# - Create n # of nested loops - ie. If n = 3, we need to create 3 nested loops
#   - Each loop tracks the index of one element in the subarray being created

# Algorithm:
# Given an array of elements, `array`, and an integer, `n`:
