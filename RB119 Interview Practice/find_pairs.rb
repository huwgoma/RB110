# Find All Pairs
# Given an array of integers, count all 'pairs' in the array and return the number
#   of pairs in the array.
# - Numbers can only be used once per pair (eg. [1, 1, 1] can only form 1 pair)
# - If the array is empty or contains 1 value, return 0

# Input:
#   An array of integers 
# Output:
#   An integer representing the number of integer pairs in the given array
# - 0 if array contains less than 2 elements.

# Examples
# pairs([1, 2, 5, 6, 5, 2]) == 2
# pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# pairs([1000, 1000]) == 1
# pairs([]) == 0
# pairs([54]) == 0

# Data:
# The array of integers given as input
# - May have to duplicate the array 
# - Maybe sort array, iterate through integers, skip 1 integer if there is a pair

# Algorithm:
# Given an array of integers as input, integers:
# Sort integers in ascending order (so all integers are sorted low->high)

# Initialize a new variable, pairs = 0
# New flag variable, skip = false
# Iterate through integers with index. For each integer:
#   If skip is true, set it back to false, then skip to the next iteration.
#   If the current integer is equal to the integer at the next index (index + 1), 
#     increment pairs by 1, then set skip to true.
# Return count

require 'pry'

def pairs(integers)
  integers = integers.sort
  pairs = 0
  skip_current = false
  
  integers.each_with_index do |int, index|
    if skip_current 
      skip_current = false
      next

    elsif int == integers[index + 1]
      pairs += 1
      skip_current = true
    end
  end
  pairs
end

# Another Angle?
# Sort the array (duplicate)
# Initialize a loop and index = 0. For each iteration:
# Retrieve the current integer and the next integer.
# If current and next are equal, increment count by 1 and index by 2;
#   otherwise increment index by 1

# def pairs(integers)
#   integers = integers.sort
#   pairs = 0
#   index = 0

#   while index < integers.size 
#     current_int = integers[index]
#     next_int = integers[index + 1]
#     if current_int == next_int
#       pairs += 1
#       index += 2
#     else
#       index += 1
#     end
#   end
#   pairs
# end


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0