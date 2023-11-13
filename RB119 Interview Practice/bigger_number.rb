# Write a method that takes a positive integer and returns the next-largest
#   number formed from the same digits.

# Input: An integer
# Output: Also an integer
# - The digits of the returned integer are identical to the input integer's digits
# - The numeric value of the integer should be the next-largest value that we can
#   obtain from the input integer's digits.
# - If a bigger number cannot be obtained, return -1.

# Examples:
# bigger_number(12) == 21
# bigger_number(513) == 531
# bigger_number(2017) == 2071

# bigger_number(351) == 531

# bigger_number(9) == -1
# bigger_number(111) == -1
# bigger_number(531) == -1

# Data:
#   The integer given as input
#   - Probably need to split the integer into an array of its digits.

# Algorithm:
# Given an integer as input, int:
# Create an array of the digits within int in reverse order:
#   513 => [5, 1, 3] => [3, 1, 5] (reversed)
# Initialize a loop and index = 0. For each iteration:
#   Swap the digit at the current index with the digit at the next index.
#     [3, 1, 5], index = 0 ; [1, 3, 5]
#     Convert this swapped array back into a number => 531
#   If new number is larger than int, return new number

#   Otherwise:
#     Undo the swap and remove any nils
#     increment index by 1 and repeat.

# -1 cases:
#   Return -1 If index is greater than or equal to digits size, return -1

# def bigger_number(int)
#   digits = int.digits # reversed

#   index = 0
#   loop do
#     swap_consecutive_digits!(digits, index)
#     swapped_num = digits.reverse.join.to_i
#     if swapped_num > int
#       return swapped_num
#     else
#       swap_consecutive_digits!(digits, index)
#       digits.compact!
#       index += 1
#     end
#     return -1 if index >= digits.size
#   end
# end

def bigger_number(int)
  digits = int.digits # Reversed
  
  largest_num = digits.sort.reverse.join.to_i
  return -1 if largest_num == int

  digits.each_with_index do |digit, index|
    swap_consecutive_digits!(digits, index)
    swapped_num = digits.reverse.join.to_i
    return swapped_num if swapped_num > int

    swap_consecutive_digits!(digits, index)
  end
end

def swap_consecutive_digits!(digits, index)
  digits[index], digits[index + 1] = digits[index + 1], digits[index]
end


p bigger_number(12) == 21
p bigger_number(513) == 531
p bigger_number(2017) == 2071 
p bigger_number(351) == 531
p bigger_number(123456789) == 123456798

p bigger_number(9) == -1
p bigger_number(111) == -1
p bigger_number(531) == -1

# -1 cases:
# if the number is already the largest it can be

# If the number is already the largest number that can be created with its digits,
# return -1.

# otherwise:
# Iterate through digits with index. For each digit:
#   Swap the digits at the current index (i = 0) and the next index (i + 1)
#   Convert the resulting digits back into an integer
#   If the swapped number is greater than int, return the swapped number
#   Otherwise, revert the swap and continue with the next iteration