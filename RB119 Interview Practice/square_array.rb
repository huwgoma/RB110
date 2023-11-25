# Are they the 'same'?
# Given 2 arrays, a and b, write a method that checks whether the two arrays 
#   have the 'same' elements, with the same number of occurences.
# - 'same' => The elements in array b are the elements in array a, squared.

# ie. Given 2 arrays, write a method that returns a boolean.
# True if the second array contains all the same elements from the first array, 
#   but squared (order is irrelevant)

# Input: Two arrays of integers, a and b
# - Do we assume they will contain the same number of elements? (dont have to)
# Output: A Boolean
# - True if the second array's elements are that of the first array's elements,
#   but squared
#   - Order does not matter (sort)
# - False otherwise

# Example:
# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
# 11 squared is 121; 19 squared is 361 (2 instances of 19); etc.

# square_array?([121, 144, 19, 161, 19, 144, 19, 11], 
#   [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true

# square_array?([121, 144, 19, 161, 19, 144, 19, 11],  
#   [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
#   # 132 is not the square of any element in array_a

# Data:
# The two arrays given as input, array_a and array_b
# - Probably sort both arrays, then map over array_a and square each element
#   and then compare with array_b

# Algorithm:
# Given two arrays of integers, array_a and array_b:
# Sort both arrays
# (Transform) iterate over array_a. For each element of a:
#   Calculate the square of the current element
# => An array of squared integers (from array a)
# Compare the squared integers array to array b and compare for equality

def square_array?(array_a, array_b)
  array_a, array_b = array_a.sort, array_b.sort
  array_a.map { |int_a| int_a ** 2 } == array_b
end

p square_array?([121, 144, 19, 161, 19, 144, 19, 11], 
  [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true

p square_array?([121, 144, 19, 161, 19, 144, 19, 11],  
  [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false