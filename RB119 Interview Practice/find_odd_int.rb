# Find the odd int
# Given an array of integers, find the one integer that appears an odd number of 
#   times.
# - Assume that the array will always only contain one integer that appears an 
#   odd number of times.

# Input: An array of integers
# Output: An integer
# - Representing the one integer that appears an odd number of times

# Examples:
# find_odd([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) ==  5
# find_odd([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
# find_odd([20,1,1,2,2,3,3,5,5,4,20,4,5]) ==  5
# find_odd([10]) == 10
# find_odd([1,1,1,1,1,1,10,1,1,1,1]) == 10
# find_odd(1, 3, 3, 1, 7) == 7

# Data:
# The array of integers given as input
# - Contains only one integer that occurs <odd number> of times
# - All other elements will occur <even number> of times
# - Probably count how many times each element occurs? then find the one 
#   with an odd number of occurrences

# Algorithm:
# Given an array of integers as input, integers:
# Iterate through the unique integers in integers. For each unique integer:
#   Count how many times the current integer appears in the original integers
#     array (non-unique)
#   Return the current integer if its count is odd
# ? What to return if all elements occur evenly?

def find_odd(integers)
  integers.uniq.each do |int|
    return int if integers.count(int).odd?
  end
end

p find_odd([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) ==  5
p find_odd([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_odd([20,1,1,2,2,3,3,5,5,4,20,4,5]) ==  5
p find_odd([10]) == 10
p find_odd([1,1,1,1,1,1,10,1,1,1,1]) == 10
p find_odd([1, 3, 3, 1, 7]) == 7