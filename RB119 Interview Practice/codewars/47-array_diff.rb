# Array.diff
# Write a method that subtracts one Array from another and returns the result
# - Remove all values from Array 1 that are also present in Array 2, maintaining 
#   insertion order.

# Input: Two Arrays 
# Output: Array A (?), but with all shared elements between the two Arrays removed
# -ie. The returned Array should only contain elements that are not in both 
#   given arrays.
# - If a value is present in Array B, remove all of its occurrences from Array A
#   eg. [1, 2, 2] and [2] => [1] (remove both 2s from array a)

# Examples:
# array_diff([1,2], [1]) == [2]
# array_diff([1,2,2], [1]) == [2,2]
# array_diff([1,2,2], [2]) == [1]
# array_diff([1,2,2], []) == [1,2,2]
# array_diff([], [1,2]) == []
# array_diff([1,2,3], [1,2]) == [3]

# Data:
# The two arrays given as input, Array A and Array B
# - Remove all values from Array A that are present in Array B (qty does not matter)
# - Iterate through Array B.
#   - If the current element is included in Array A, delete all instances of that
#     element from A

# Algorithm:
# Given two arrays as input, array_a and array_b:
# Iterate through array_b. For each element:
#   If the current element is in array_a, destructively remove all instances
#     of that element from array_a
# Return array_a

def array_diff(array_a, array_b)
  array_b.each_with_object(array_a) do |element, array_a|
    array_a.delete(element)
  end
end


p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
p array_diff([1,2,3], [1,2]) == [3]