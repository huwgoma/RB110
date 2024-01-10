# Is Integer Array?
# Write a method that takes an array and returns a Boolean:
# - True if all elements are integers or floats ending in .0
# - True if array is empty
# - False otherwise

# Input: An array of elements
# Output: A Boolean
# - True if all elements are integers/floats that have no decimals 
#   - True if array is empty
# - False otherwise

# Examples:
# is_int_array([]) == true
# is_int_array([1, 2, 3, 4]) == true
# is_int_array([-11, -12, -13, -14]) == true
# is_int_array([1.0, 2.0, 3.0]) == true
# is_int_array([1, 2, nil]) == false
# is_int_array(nil) == false
# is_int_array("") == false
# is_int_array([nil]) == false
# is_int_array([1.0, 2.0, 3.0001]) == false
# is_int_array(["-1"]) == false

# Data:
# The array given as input
# - Iterate through the array and check that all elements are whole numbers 

# Algorithm:
# Given an array as input, array:
# Return false if input is not an array
# Iterate through array. For each element:
# - Verify that every element is a Numeric class, and that the current element
#   is equivalent to itself if converted to an integer (whole)
# - If for any element this is false, exit iteration and return false
# Otherwise return true

def is_int_array(input)
  return false unless input.is_a?(Array)
  
  input.all? do |element|
    element.is_a?(Numeric) && element.to_i == element
  end
end

p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false