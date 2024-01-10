# Integer Reduction
# Write a method that takes two integers, n and k; remove k # of digits from n, 
#   and return the lowest number possible, without changing the order of n's digits.
# - Return the result as a string.

# Input: Two integers, n and k
# - We have to remove k # of digits from n, such that the resulting number is the
#   lowest possible number that can be formed (without rearranging any other digits)
# Output: A String
# - Representing the lowest possible number that can be created by removing k
#   digits from n

# Examples:
# reduction(123056, 1)
# - Which number do we remove? -> 3 -> 12056 (smallest)
#   - 1 number before the smallest number (0)
#   - Maybe not smallest? but the first number that is smaller than the preceding
# reduction(1284569, 1) 
# - Remove 8 (first number that is larger than the following)

# reduction(1284569, 2)
# - Remove 8 and 9 -> 12456
# reduction(123056, 2) -> Remove 2 and 3 -> 1056

# Data:
# The integers n and k given as input
# - Convert n to an array of digits
# - Create a nested array where each subarray is a possible (in-order) combination
#   of digits (size is equal to n size - k)
# - Select the subarray combination with the lowest numerical value

# Algorithm:
# Given two integers, n and k as input:
# Convert n to an array of digits 
# Create an array of subarrays where each subarray is a possible combination
#   of digits (length of subarray is equal to n's length - k)
#   - Convert each subarray to a string
# Select the smallest string by numeric value

def reduction(n, k)
  digits = n.digits.reverse
  digit_combinations = digits.combination(digits.size - k).map(&:join)
  digit_combinations.min_by(&:to_i)
end

p reduction(123056,1) == '12056'
p reduction(123056,2) == '1056'
p reduction(123056,3) == '056'
p reduction(123056,4) == '05'
p reduction(1284569,1) == '124569'
p reduction(1284569,2) == '12456'
p reduction(1284569,3) == '1245'
p reduction(1284569,4) == '124'