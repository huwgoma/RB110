# Sum of Pairs
# Write a method that takes an array of integers and an integer `target_sum`, 
#   and returns an array of the two values in `integers` that can be added to 
#   form the `target_sum`.
# - If there are two or more pairs that can form the req'd sum, return the pair
#   whose SECOND element has the smaller index.
# - If there are no pairs of integers that can produce the req'd sum, return nil.

# store valid second index in var; if a new valid pair is found, and the second index is smaller, update the valid pair

# Input: An array of integers, and an integer acting as the target sum
# Output: An array representing the two integers that add up to the target sum
# - nil if no such integer pair exists
# - If multiple pairs exist, return the one with the lowest second index value
#   (ie. the pair whose second element appears the earliest)

# Examples:
# sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
# sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
# sum_pairs([20, -13, 40], -7) == nil
# sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
# sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
# sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
# sum_pairs([0, 2, 0], 0) == [0, 0]
# sum_pairs([5, 9, 13, -3], 10) == [13, -3]

# Data:
# The array of integers given as input, `integers`
# - Iterate through integers and create a nested array of subarrays, where each
#   subarray represents a possible pair of integers
#   - Initialize two loops to track the index of the first element and the index of 
#     the second element.
# Maybe create a hash to store the solution:
#   - { Pair: [ele1, ele2], second_index: some number }
#   - If the current pair of integers matches target sum, update solution hash's pair and second_index 
#     only if the current second index is less than solution[second_index]
# The integer given as input, `target_sum`

# Algorithm:
# Given an array of integers as input, `integers`, and an integer as the target sum:
# Initialize a new Hash, solution = { pair: nil, second_index: integers.size (?) }
# Create a nested array of 2-element pairs in `integers`.
#   - Create 2 nested loops:
#   1) [i] Track the index of the first element
#   2) [i2] Track the index of the second element
#   For each pair of elements:
#   - If integers[i] + integers[i2] is equal to the target sum AND i2 is less than solution[second_index]:
#     - Update solution[pair] = [integers[i], integers[i2]] and solution[second_index] to
#       second index
# Return solution[pair]

def sum_pairs(integers, target_sum)
  solution = { pair: nil, second_index: integers.size }

  (0...(integers.size - 1)).each do |i|
    ((i + 1)...(integers.size)).each do |i2|
      first_int, second_int = integers[i], integers[i2]
      if first_int + second_int == target_sum && i2 < solution[:second_index]
        solution[:pair] = [first_int, second_int]
        solution[:second_index] = i2
      end
    end
  end
  solution[:pair]
end

p sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
p sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
p sum_pairs([20, -13, 40], -7) == nil
p sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
p sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
p sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
p sum_pairs([0, 2, 0], 0) == [0, 0]
p sum_pairs([5, 9, 13, -3], 10) == [13, -3]

