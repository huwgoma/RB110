# Find Even Index
# Given an array of integers, find the index n where the sum of the integers
#   before n (to the left) is equal to the sum of the integers after n (right)
# - If no such index exists, return -1
# - The element AT index n is not counted in the left/right sums

# Input: An array of integers
# Output: An integer 
# - Represents the index at which the left and right halves of the array
#   will have the same sum.

# Examples:
# p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
# p find_even_index([1, 100, 50, -51, 1, 1]) == 1
# p find_even_index([1, 2, 3, 4, 5, 6]) == -1
# p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
# p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
# p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
# p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

# Data:
# The array of integers given as input
# - Probably iterate through each integer and calculate the sums before/after
#   that element (w/ index?)

# Algorithm:
# Given an array of integers as input, integers:
# Iterate through each index of integers. For each index:
#   Calculate the sum of the integers to the left of the current index:
#   - Create a subarray, starting from index 0, ending at index <current index - 1>
#   Calculate the sum of the integers to the right of the current index:
#   - Create a subarray, starting from <index + 1>, ending at index -1 (end of array)
#   If left sum is equal to right sum, exit iteration and return the current index.
# = End of iteration => Return -1

def find_even_index(integers)
  integers.each_index do |index|
    left_sum = integers[0...index].sum
    right_sum = integers[index + 1..-1].sum
    return index if left_sum == right_sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3