# Find the Parity Outlier
# Given an array (at least 3 integers), consisting of entirely odd or entirely even
#   integers, with one exception (N), return the outlier integer N

# Input: An array of integers
# - All integers will be either odd or even; there will be one integer that is
#   even or odd (opposite of the rest)
# Output: The integer N that is the outlier in the array

# Examples:
# [2, 4, 0, 100, 4, 11, 2602, 36]
# - Establish the dominant even/odd: 
#   - Take the first 3 elements and count whether there are more even or odd
#     integers (2, 4, 0) - we know it's even
# - Select the element that is the opposite of the dominant parity (11)

# Data:
# The array of integers given as input
# Calculate the dominant parity
# - Take the first 3 elements; if the number of even integers exceeds 1, 
#   dominant parity is even; vice-versa for odd
# Select the integer that returns true for the opposite parity check
# - ie. if dominant is even, select the integer that returns true for odd?

# Algorithm:
# Given an array of integers as input, `integers`:
# Find the dominant parity of `integers`:
#   Initialize a new variable, even_dominant = nil
#   Slice the first 3 elements
#   - If the count of even elements in the first 3 elements is greater than 1,
#     set even_dominant to true; otherwise, false
# If even_dominant is true, select the integer that is odd?
# Otherwise, select the integer that is even?

def find_outlier(integers)
  even_dominant = integers[0, 3].count(&:even?) > 1
  integers.find { |int| even_dominant ? int.odd? : int.even? }
end

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160