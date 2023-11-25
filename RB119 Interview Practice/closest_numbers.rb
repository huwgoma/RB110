# Closest Numbers
# Write a method that takes an array of integers and returns the 
# two numbers that are closest in value.

# Input: An array of integers
# Output: A new array containing the two integers that are the closest in 
#   numeric value.

# Examples:
# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
#   [5, 25] - difference 20.
#   15 - difference is 10/10 - replace 5 -> [15, 25] - difference 10
#   11


# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]

# p closest_numbers([12, 7, 17]) == [12, 7]
#   [12, 7, 17]
#   [12, 7] - Difference 5.
#   Iterate over each element (except the first 2)
#   - 17: The difference is either 5 (12) or 10; neither difference is less than
#     the existing difference, so do not replace either element.

# Data:
# The array of integers given as input
# An array of two integers (closest)

# Algorithm:
# Given an array of integers, integers:
# Create a nested array containing all 2-element permutation subarrays.
#   [12, 7, 17] => [[12, 7], [12, 17], [7, 17]]
#   Create a new array, number_subarrays = []
#   Iterate through integers with index. For each index:
#     Initialize a new variable second_index = index + 1
#     Initialize a loop. For each iteration:
#       Create a subarray. Add current element to subarray, then add element at
#         second_index to subarray.
#       Increment second_index by 1
#       Exit loop when second index equals array size.

# Iterate through these 2-element subarrays and find the one with the lowest 
#   difference (subtract + absolute)

def closest_numbers(integers)
  subarrays = []
  
  integers.each_with_index do |integer, index|
    second_index = index + 1  
    while second_index < integers.size
      subarrays << [integer, integers[second_index]]
      second_index += 1
    end
  end

  subarrays.min_by { |numbers| (numbers.first - numbers.last).abs }
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]