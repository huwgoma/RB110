# Group and Count
# Write a method that takes an array and returns a Hash.
# - The Hash keys should be the unique values of the array
# - The Hash values should be the count of each value.
# - Do not use Array#count or Array#length

# - Empty array should return nil

# Input: An Array
# Output: A Hash
# - Keys are the Array's unique elements
# - Values are the count of each unique element

# Example:
# group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
# group_and_count([0,1,1,0]) == {0=>2, 1=>2}

# Data:
# The array given as input
# - Probably iterate over the array and build the hash to be returned.
# - If hash already contains the current element as int, increment value by 1
# - Otherwise create a new key-value pair

# Algorithm:
# Given an array of elements, array:
# Create a new hash to be returned, element_counts = { } (default value 0)
# Iterate over array. For each element:
#   If element_counts does not yet have a key-value pair with the current element
#     as key, create a new key-value pair (value 0) and increment by 1.
#   Otherwise, increment the corresponding key-value pair's value by 1.
# Return element_counts

def group_and_count(array)
  element_counts = Hash.new(0)
  array.each do |element|
    element_counts[element] += 1
  end
  element_counts
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([0,1,1,0]) == {0=>2, 1=>2}
