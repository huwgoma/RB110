# Write a method that takes a positive integer and returns the next-largest
#   number formed from the same digits.
# - If no bigger number can be formed (ie. number is already the biggest), 
#   return -1 instead.

# Input: An Integer (Assume positive)
# Output: Also an Integer
# - The next-largest Integer that can be formed with the input Integer's digits
# - If the input Integer is already the largest number that can be formed with those
#   digits, return -1.

# Examples:
# p bigger_number(691) == 916
# p bigger_number(12) == 21
# p bigger_number(513) == 531
# p bigger_number(2017) == 2071
# p bigger_number(2343) == 2433

# p bigger_number(9) == -1
# p bigger_number(111) == -1
# p bigger_number(531) == -1

# Data:
# The Integer given as input
# Create an array of the integer's digits eg. 691 -> [6, 9, 1] (next largest: 916)
# Create a 2D array of all possible digit permutations eg. 691 -> [6, 9, 1], [6, 1, 9], [9, 6, 1], [9, 1, 6], [1, 9, 6], [1, 6, 9]
#   - Or create a 2D array of integers (all possible digit permutations) eg. 691 -> 169, 196, 619, 691, 916, 961 
# Find the index of the input integer
# Find the integer that is at index + 1 (if nil, return -1)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Permutation Approach (inefficient but readable)

# Algorithm:
# Given an integer as input, int:
# Create an array of int's digits 
# Create an array of digit permutations (integers) from digits (sorted ascending)
#   #permutations
# Retrieve the integer at index(int) + 1

# def bigger_number(int)
#   int_digits = int.digits.reverse
#   permutations = int_digits.permutation.map { |digits| digits.join.to_i }.uniq.sort
#   permutations.fetch(permutations.index(int) + 1, -1)
# end

# p bigger_number(691) == 916
# p bigger_number(12) == 21
# p bigger_number(513) == 531
# p bigger_number(2017) == 2071
# p bigger_number(2343) == 2433
# p bigger_number(9) == -1
# p bigger_number(111) == -1
# p bigger_number(531) == -1

# p bigger_number(459853) == 483559

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Algorithm (Optimize):
# Given an integer as input, int:
# Create an array of digits from int (ones first)
#   459853 -> [4, 5, 9, 8, 5, 3] -> [3, 5, 8, 9, 5, 4]
# Find the index of the number that we want to make a swap at.
#   Iterate through each index of digits (exclude last index). For each index:
#     Look ahead; retrieve the number at the current index, and the number at the
#       next index.
#     - If the number at the current index is greater than the number at the next
#       index, our swap index will be index + 1.
# Create a slice from digits, starting at index 0, ending at swap index - 1
#   Find the smallest integer in the digits slice that is still larger than the
#     number at the swap index.
#   - Swap the smallest larger integer and the number at the swap index.
# Sort the subarray to the left of swap index in descending order, and reassign
#   the corresponding indexes to the sorted array
# - Convert digits back to an integer (reverse)

# def bigger_number(int)
#   digits = int.digits

#   rswap_index, lswap_index = find_swap_indexes(digits)
#   return -1 if rswap_index.nil?

#   digits[rswap_index], digits[lswap_index] = digits[lswap_index], digits[rswap_index]

#   digits[0...rswap_index] = digits[0...rswap_index].sort { |a, b| b <=> a }
#   digits.join.reverse.to_i
# end

# # find_swap_indexes
# # Find and return the indexes of the numbers to be swapped 
# # Given an array of digits (in reverse), digits:
# # - The right swap index is the first index where the next digit
# #   is less than the current digit
# # - The left swap index is the index of the smallest number within the subset
# #   of digits to the left of the rswap index that is greater than the rswap number.
# # rswap_index:
# #   - Iterate through each index of digits (exclude last.) For each index:
# #     - Retrieve the current digit and the next digit
# #     - Return nil if the next digit is nil (means we are at the end of the 
# #       digits without finding a right swap - ie. the number is already the 
# #       largest possible number with its digits)
# #     - If the current digit is greater than the next digit, the rswap index is
# #       equal to the current index + 1; exit iteration and assign index + 1 to
# #       rswap_index
# # lswap_index:
# #   - Create a subarray consisting of all elements to the left of the rswap index.
# #   - Find the index of the smallest integer within the left subarray that is 
# #     still larger than the element at rswap index.
# #     - Find the smallest element (integer) that is larger than the value at rswap
# #       index.
# #       - Select all values that are greater than rswap value
# #       - Return the min
# #     - Find the index of the min larger value 
# # Return rswap_index and lswap_index

# def find_swap_indexes(digits)
#   rswap_index = digits.each_index do |index|
#     digit, next_digit = digits[index], digits[index + 1]
#     return if next_digit.nil?

#     break index + 1 if digit > next_digit
#   end

#   min_larger_value = digits[0...rswap_index].select { |d| d > digits[rswap_index] }.min
#   lswap_index = digits.index(min_larger_value)
#   [rswap_index, lswap_index]
# end

# # [3, 5, 8, 9, 5, 4] 


# p bigger_number(691) == 916
# p bigger_number(12) == 21
# p bigger_number(513) == 531
# p bigger_number(2017) == 2071
# p bigger_number(2343) == 2433
# p bigger_number(9) == -1
# p bigger_number(111) == -1
# p bigger_number(531) == -1

# p bigger_number(459853) == 483559


# [3, 5, 8, 9, 5, 4] 

#             459853 
# Expected:   483559

# 459853 -> [4, 5, 9, 8, 5, 3] -> [3, 5, 8, 9, 5, 4]
# 3 is less than 5; 5 is less than 8; 8 is less than 9;
# 9 is greater than 5; the index of the 2nd 5 (index 4) is where we will make a swap
#   Find the smallest number to the left of index 4 that is greater than 5. (8)
#   Swap 8 and 5 -> [3, 5, 5, 9, 8, 4]
#   Sort the subarray to the left of index 4 [3, 5, 5, 9] in descending order -> [9, 5, 5, 3]
#   - Reassign the corresponding indexes to the sorted array -> [9, 5, 5, 3, 8, 4]
#   - Convert back to an int -> 483559
#   

# 3 is less than 5; 5 is less than 8; 8 is less than 9;
# 9 is greater than 5 - so 5 is where we will make (a) swap
# [4, -5-, 9, 8, 5, 3] - What is the smallest number in [5, 9, 8, 5, 3] that is larger than 5? -> 8
# [4, 8, 9, 5, 5, 3] - Post-swap; sort the digits to the right of the swap in ascending order
# [4, 8, -3-, 5, 5, 9]


# # # # # # # # # # # # # # # # Looping Version
# Return -1 if given number == maximum number
# Iterate from the given number up to the maximum number. 
# For each number: 
# - Does the current number have the same digits?
# - If yes, return current number

# Algorithm:
# Given an integer as input, int:
# Calculate the maximum possible int that can be created with int's digits
# - Sort int's digits, then join back to a number
# If int == max number return -1
# Otherwise:
# Iterate from int to max number. For each number:
# - If the current number has the same digits as int's digits, return number
#   - For each number, extract + sort the digits, then compare to max number - 
#     should be equal if they contain the same digits

def bigger_number(int)
  max_num = int.digits.sort.reverse.join.to_i
  return -1 if int == max_num

  (int + 1).upto(max_num) do |i|
    return i if i.digits.sort.reverse.join.to_i == max_num
  end
end


p bigger_number(691) == 916
p bigger_number(12) == 21
p bigger_number(513) == 531
p bigger_number(2017) == 2071
p bigger_number(2343) == 2433
p bigger_number(9) == -1
p bigger_number(111) == -1
p bigger_number(531) == -1

p bigger_number(459853) == 483559