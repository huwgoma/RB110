# Are they the 'same'?
# Given two arrays, arr1 and arr2, write a method that checks whether the elements
#   in arr2 are the elements in arr1 squared 
# - Order of elements does not matter.

# Input: Two Arrays of integers
# Output: A boolean:
# - True if arr2 can be produced by squaring every element in arr1 (disregarding
#   order.)

# Examples:
# comp([121, 144, 19, 161, 19, 144, 19, 11], 
# [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true

# Data:
# The two arrays as input, arr1 and arr2
# - True condition is if every element in arr2 is the square of a corresponding
#   element in arr1
# - Map over arr1, square each element, then sort the result
#   - If result is equal to arr2 sorted, true

# Algorithm:
# Given two arrays as input, arr1 and arr2:
# Sort arr1 in ascending order, then transform each element of arr1 to its square
# - If the sorted+squared arr1 is equal to arr2 sorted, return true

def comp(arr1, arr2)
  return false if arr1.nil? || arr2.nil?
  arr1.sort.map { |int| int ** 2 } == arr2.sort
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], 
  [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true