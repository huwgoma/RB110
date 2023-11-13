# Given an array of integers, find an index N where the sum of 
#   integers to the left (before) N is equal to the sum of the
#   integers to the right (after) N.
# - If there is no valid index meeting this condition, return -1.
# - The number AT index N is not counted in either sum
# - Empty arrays are summed as 0

# Input: An array of integers
# Output: An integer
# - representing the index of the element at which the 
#   sum of elements before and after that element are equal

# create subarray on each side of the current index ele

# Examples:
# find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# find_even_index([1, 100, 50, -51, 1, 1]) == 1
# find_even_index([1, 2, 3, 4, 5, 6]) == -1
# find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
##   [].sum == [10, -80, 10, 10, 15, 35].sum
# find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# Data: 
#   The array of integers given as input
#   - May need to iterate through each index 
#   - For each index, partition the array into 2 subarrays (L/R)?

# Algorithm:
# Given an array of integers, integers:
# Iterate through each position (index) of integers. for each index:
#   Create a new empty array, subarrays = [[left] [right]]
#   Iterate through integers again. For each element:
#     If the index of the current integer is less than the 
#       current index, add it to the left subarray
#     If index of current integer is greater than current index,
#       add it to the right subarray.
#   eg. [1, 2, 3]
#     index 0 => [[], [2, 3]]
#     index 1: => [[1], [3]]
#   Add subarrays to result array
# => Nested array containing arrays of 2 partitioned subarrays (L/R)
# eg. [ [[], [2, 3]], [[1], [3]], [[1, 2], [3]] ]
# Iterate through this nested array. For each array:
#   - Sum the elements of both subarrays. If, for any array, 
#     the sums of both subarrays are equal, return the index of that
#     array.
#   - Otherwise, return -1.


# def find_even_index(integers)
#   partitioned_subarrays = []
#   integers.each_index do |n|
#     partition = integers.partition.with_index do |int, index|
#       index <= n
#     end
#     partition.first.pop
#     partitioned_subarrays << partition
#   end
  
#   partitioned_subarrays.each_with_index do |subarray, n|
#     return n if subarray.first.sum == subarray.last.sum
#   end
#   -1
# end

# def find_even_index(integers)
#   partitions = integers.map.with_index do |_int, n|
#     subarrays = integers.partition.with_index do |int, idx|
#       idx <= n
#     end
#     subarrays.first.pop
#     subarrays
#   end

#   partitions.each_with_index do |subarr, n|
#     return n if subarr.first.sum == subarr.last.sum
#   end
#   -1
# end

# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p find_even_index([1, 100, 50, -51, 1, 1]) == 1
# p find_even_index([1, 2, 3, 4, 5, 6]) == -1
# p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3



# Algorithm Refactor:
# Given an array of integers, integers:
# Iterate through each index of integers. For each index, n:
#   Create two arrays: left and right
#   - left will contain all elements from position 0 to the 
#     position before n
#     - If index is 0, will need to manually assign to empty array
#       (otherwise would do 0..-1)
#   - right contains all elements from position n + 1 to end of
#     array
#   Sum the elements of the two arrays. 
#   If the sums are equal, return current index n
#   Otherwise go next
# Return -1 if iteration finishes.

def find_even_index(integers)
  integers.each_index do |n|
    before = n.zero? ? [] : integers[0..(n - 1)]
    after = integers[(n + 1)..-1]
    return n if before.sum == after.sum
  end
  -1
end

# [1, 2, 3, 4]
# n = 0, int = 1 => before [] after [2, 3, 4]
# n = 1, int = 2 => before [1] after [3, 4] 
# n = 2, int = 3 => before [1, 2] after [4]

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3