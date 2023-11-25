# Sum Of Pairs
# Given an array of integers and an integer, return the first two values
#   that can form the given integer when added.

# Input: An array of integers; also an integer representing the desired sum
# Output: An array of the two earliest integers that add up to reproduce
#   the sum
# - If there are two or more pairs with the required sum, the pair whose 
#   SECOND element has the smaller index is the solution.
# - nil if no such pairs exist

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
# The array of integers given as input
# - Probably iterate through each index and calculate the sum of the current integer
#   + the integers at index + 1, index + 2, ... until last index


# Algorithm: 
# Given an array of integers as input, and a desired integer sum:
# Iterate through integers with index. For each integer/index:
#   Initialize a loop and end_index = index + 1. For each iteration:
#     Calculate the sum of adding the current integer to the integer at 
#       the current end_index.
#     If the sum is equal to the given sum, RETURN the current integer and the 
#       end integer in an array.
#     Otherwise, increment end_index by 1
#     Stop looping when end_index reaches the size of integers 
# If we make it out of iteration without returning anything, return nil

def sum_pairs(integers, sum)
  integers.each_with_index do |int, index|
    end_index = index + 1
    while end_index < integers.size
      end_int = integers[end_index]
      return [int, end_int] if int + end_int == sum
      end_index += 1
    end
  end
  nil
end

# p sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
# p sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
# p sum_pairs([20, -13, 40], -7) == nil
# p sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
# p sum_pairs([10, 5, 2, 3, 7, 5], 10) # == [3, 7]
# p sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
# p sum_pairs([0, 2, 0], 0) == [0, 0]
# p sum_pairs([5, 9, 13, -3], 10) == [13, -3]


# p sum_pairs([10, 5, 2, 3, 7, 5], 10) # == [3, 7]
# Returning [5, 5], but we want to return [3, 7] because 7 (the second number)
#   has the smaller index than the second 5.
# Could maybe collect all the possible solutions as hashes?
#   Key: The index, Value: The corresponding integer at the index

# [5, 2, 8, 3, 7, 5] => [ 
#   { pair: [5, 5], end_index: 5 },
#   { pair: [2, 8], end_index: 2 },
#   { pair: [3, 7], end_index: 4 }
# ] 

# Find the hash that has the smallest end_index value.

def sum_pairs(integers, sum)
  possible_pairs = []
  integers.each_with_index do |int, index|
    end_index = index + 1

    while end_index < integers.size
      end_int = integers[end_index]
      if int + end_int == sum
        possible_pairs << { pair: [int, end_int], end_index: end_index }
      end
      end_index += 1
    end
  end
  return nil if possible_pairs.empty?
  possible_pairs.min_by { |hash| hash[:end_index] }[:pair]
end

p sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
p sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
p sum_pairs([20, -13, 40], -7) == nil
p sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
p sum_pairs([10, 5, 2, 3, 7, 5], 10) == [3, 7]
p sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
p sum_pairs([0, 2, 0], 0) == [0, 0]
p sum_pairs([5, 9, 13, -3], 10) == [13, -3]