# Given an array of numbers, return the count of 3-number combinations where 
#   the values are in decreasing order.

# Input: An array of integers
# Output: An integer representing the number of 3-number combinations where all values are
#   in decreasing order.

# Examples:
# puts count_decreasing_triplets([5, 4, 3, 2, 1]) # Expected output: 10
#   [5, 4, 3], [5, 4, 2], [5, 4, 1], [5, 3, 2], [5, 3, 1], [5, 2, 1]

# puts count_decreasing_triplets([-1, -2, -3, 4]) # Expected output: 1
# puts count_decreasing_triplets([1, 2, 3, 4, 5]) # Expected output: 0 (No combinations)

# Data:
# The array of integers given as input
# - Create an array of subarrays, where each subarray is a 3-element combination taken
#   from the given array
#   eg. [5, 4, 3, 2, 1] => [[5, 4, 3], [5, 4, 2], [5, 4, 1], ..., [3, 2, 1]]
# - Iterate through these subarrays and count the number of subarrays where elements are 
#   in decreasing order (ie. subarray is equal to subarray sorted by descending order)

# Algorithm:
# Given an array of integers, `integers`:
# Create an array of all possible 3-number combinations from `integers` (triplets)
#   Initialize a 3-nested loop:
#     1 (i): Iterate from index 0 to index (size - 3)
#     2 (i2): Iterate from index i + 1 to index (size - 2)
#     3 (i3): Iterate from index i2 + 1 to index (size - 1)
#     - Create an array using the elements at indexes i, i2, and i3, then add the array
#       to triplets array
# Iterate through triplets. For each subarray:
#   Sort the current subarray (descending order), then check whether the original (unsorted)
#   subarray is equal to the sorted subarray
#   - If true, increment count by 1
# Return count

def count_decreasing_triplets(integers)
  triplets = create_array_triplets(integers)
  triplets.count { |triplet| triplet == triplet.sort { |a, b| b <=> a } }
end

def create_array_triplets(array)
  (0..array.size - 3).each_with_object([]) do |i, triplets|
    (i + 1).upto(array.size - 2) do |i2|
      (i2 + 1).upto(array.size - 1) do |i3|
        triplets << [array[i], array[i2], array[i3]]
      end
    end
  end
end


puts count_decreasing_triplets([5, 4, 3, 2, 1]) # Expected output: 10
#   [5, 4, 3], [5, 4, 2], [5, 4, 1], [5, 3, 2], [5, 3, 1], [5, 2, 1]

puts count_decreasing_triplets([-1, -2, -3, 4]) # Expected output: 1
puts count_decreasing_triplets([1, 2, 3, 4, 5]) # Expected output: 0 (No combinations)



















# Input: An array of integers
# Output: An integer representing the number of 3-number combinations where the values are 
#   in decreasing order.

# Examples:
# puts count_decreasing_triplets([5, 4, 3, 2, 1]) # Expected output: 10
#   [5, 4, 3], [5, 4, 2], [5, 4, 1], [5, 3, 2], [5, 3, 1], [5, 2, 1]

# puts count_decreasing_triplets([-1, -2, -3, 4]) # Expected output: 1
# puts count_decreasing_triplets([1, 2, 3, 4, 5]) # Expected output: 0 (No combinations)

# Data:
# The array of integers given as input
# - Create an array of subarrays where each subarray contains 3-number combinations
# - Then iterate through each subarray and count the number of subarrays where 
#   the array elements are in descending order (sort descending)
# def count_decreasing_triplets(integers)
  #   count = 0
  #   integers.each_index do |i|
  #     (i + 1).upto(integers.size - 2) do |i2|
  #       (i2 + 1).upto(integers.size - 1) do |i3|
  #         array = [integers[i], integers[i2], integers[i3]]
  #         count += 1 if array.sort { |a, b| b <=> a} == array
  #       end
  #     end
  #   end
  #   count
  # end
  
  # puts count_decreasing_triplets([5, 4, 3, 2, 1])
  # puts count_decreasing_triplets([-1, -2, -3, 4]) # Expected output: 1
  # puts count_decreasing_triplets([1, 2, 3, 4, 5]) # Expected output: 0 (No combinations)
  
# Algorithm:
# Given an array of integers as input, integers:
# Initialize a new variable, count = 0
# Create an array of 3-integer subarrays:
# - Iterate over each index of integers. For each index:
#   - Initialize a second loop for the second element, starting from index + 1, ending at
#     index array size - 2
#     - Initialize a third loop for the 3rd element, starting from index + 2, ending at 
#       index array size - 1
#       - Create a 3-integer array
#       - Sort the 3-integer array in descending order. If it is equal to the original 3-
#         int array, add 1 to count
# Return count

# def count_decreasing_triplets(integers)
#   count = 0
#   integers.each_index do |i|
#     (i + 1).upto(integers.size - 2) do |i2|
#       (i2 + 1).upto(integers.size - 1) do |i3|
#         array = [integers[i], integers[i2], integers[i3]]
#         count += 1 if array.sort { |a, b| b <=> a} == array
#       end
#     end
#   end
#   count
# end

# puts count_decreasing_triplets([5, 4, 3, 2, 1])
# puts count_decreasing_triplets([-1, -2, -3, 4]) # Expected output: 1
# puts count_decreasing_triplets([1, 2, 3, 4, 5]) # Expected output: 0 (No combinations)
