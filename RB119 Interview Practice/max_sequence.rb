# Maximum Sum Sequence
# Write a method that finds the maximum sum of a consecutive sequence
#   of elements in an array of integers.
# - If the array consists of only positive numbers, the maximum sum
#   is just the entire array.
# - If the array consists of only negative numbers, return 0
# - Empty array => Return 0

# Input: An array of integers (can be positive and negative)
# Output: The highest sum that can be obtained from every possible
#   subsequence of integers

# Examples:
# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# -> [4, -1, 2, 1]

# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 (2154)


# Data:
#   The array of integers given as input
#   - Might need to create an array of all possible subsequence 
#   permutations (length will be from 1 to array length)

# Algorithm:
# Given an array of integers, integers:
# If integers is empty, or all integers are negative, return 0
# Create an array of all possible subsequences:
#   - Create an array, subsequences = []
#   - Iterate through each index of integers. For each integer index (i = 0)
#     - Loop n times, where n is equal to integers size - index. For each loop:
#     - Create an array containing elements from integers, starting from the current index, ending
#       at current index + counter for n (0, 1, 2, etc.)

#     - Add the slice to subsequences
# (transform) Iterate through subsequences. For each subsequence:
# - Calculate the sum of the current subsequence
# Pick out the max sum from the mapped sums

def max_sequence(integers)
  return 0 if integers.empty? || integers.all?(&:negative?)

  subsequences = subsequences(integers)
  subsequences.map(&:sum).max
end

# Return a nested array of all subsequences within the given array
def subsequences(array)
  subsequences = []
  array.each_index do |index|
    (array.size - index).times do |n|
      subsequences << array.slice(index..index + n)
    end
  end
  subsequences
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 # 4 - 1 2 1

p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 # 2 1 5 4
p max_sequence([1, 2, 3, 4, 5]) == 15