# Write a method that takes an array of integers and returns an integer representing 
#   the number of 3-number combinations with 2 odd numbers and 1 even. 
# - If there are no 3-number combinations with 2 odd/1 even, return -1.
# - Assume all numbers in the array will be greater than 0.

# Input: An array of integers
# Output: An integer
# - Represents the count of 3-number combinations that have 2 odd numbers (and 1 even number)
# Return -1 if count is 0

# Examples:
# puts count_triples([1, 2, 3, 4]) # Expected output: 2
#   # Possible valid combos: [1, 3, 2], [1, 3, 4]
# puts count_triples([2, 4, 6, 8]) # Expected output: -1
# puts count_triples([1, 3, 5, 7]) # Expected output: -1
# puts count_triples([1, 2, 3, 4, 5, 6]) # Expected output: 9

# Data: 
# The array of integers given as input
# - Create subarrays where each subarray is a 3-number combination from `integers`
#   eg. [1, 2, 3, 4] => [[1, 2, 3], [1, 3, 4], [2, 3, 4]]
# - Count the number of subarrays where there are 2 odd numbers (and 1 even number - given)

# Algorithm (Victor Approach):
# Given an array of integers, `integers`:
# Create an array of subarrays, where each subarray represents one possible combination of 3 unique elements (eg. can't use 
#   the same element twice (but we can have duplicate VALUES)):
#   - Initialize 3 nested loops: one for the first element, second element, and third element.
#     - First index (i): Should start at 0 and end at the 3rd-last element (2 elements behind)
#     - Second index (i2): Should start at i + 1, and end at the 2nd-last element (1 element behind)
#     - Third index (i3): Should start at i2 + 1, and end at the last element (no elements behind)
#    - Retrieve each element (i, i2, i3), add it to an array, then add the subarray to the main triplets array

# Iterate through the triplets subarrays and count how many subarrays contain exactly 2 odd numbers

def count_triples(integers)
  # triples = find_array_triplets(integers)
  triples = integers.combination(3).to_a
  p triples
  count = triples.count { |triplet| triplet.count(&:odd?) == 2 }
  count.zero? ? -1 : count
end

def find_array_triplets(array)
  # Given an array, return an array of all possible 3-element combinations (each combo is a subarray)
  (0..(array.size - 3)).each_with_object([]) do |i, triplets|
    (i + 1).upto(array.size - 2) do |i2|
      (i2 + 1).upto(array.size - 1) do |i3|
        triplets << [array[i], array[i2], array[i3]]
      end
    end
  end
end


puts count_triples([1, 2, 3, 4]) # Expected output: 2
puts count_triples([2, 4, 6, 8]) # Expected output: -1
puts count_triples([1, 3, 5, 7]) # Expected output: -1
puts count_triples([1, 2, 3, 4, 5, 6]) # Expected output: 9