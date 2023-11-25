# Find the Unique Number
# Given an array with some numbers, with all numbers being equal except one, 
#   return the one number that is unique.
# - Assume that the array will always contain at least 3 numbers.

# Input: An array of integers
# - Contains 1 unique element, and array.size - 1 duplicate elements.
# Output: An integer
# - The 1 unique element.

# Examples:
# find_uniq([1,1,1,1,0]) == 0
# find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

# Data:
# The array of integers given as input
# - iterate through unique elements and take the count for each one 
# - select the one that only appears once

# Algorithm:
# Given an array of integers as input, integers:
# Iterate through the unique elements of integers. For each unique int:
#   Count how many times the current int appears in the original (non-unique)
#     integers array. 
#   Return the current int if it only appears once.

def find_uniq(integers)
  integers.uniq.each do |int|
    return int if integers.count(int) == 1
  end
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55