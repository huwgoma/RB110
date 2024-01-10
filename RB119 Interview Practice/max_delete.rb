# Max Delete
# Write a method that takes an integer `n` and returns the largest possible number you can
#   obtain by deleting exactly 1 digit from the given number.

# Input: An integer `n`
# Output: An integer
# - The largest possible number we can obtain by deleting exactly 1 digit from n
# - All other digits should remain in order.

# Examples:
# delete_digit(791983) == 91983
# delete_digit(152) == 52
# delete_digit(1001) == 101
# delete_digit(10) == 1

# Data:
# The integer given as input
# - Maybe split integer into an array of digits? (forward)
# - Iterate over digits; for each digit
#   - Look ahead at the next digit
#   - If the next digit is greater than the current digit, the current digit is what we want to delete
#   ?

# Algorithm:
# Given an integer as input, `n`:
# Split n into an array of digits (largest->smallest place values)
# Iterate through digits with index. For each digit:
#   Retrieve the next digit
#   If next digit is nil (ie. end of number), OR is greater than current digit, delete the current digit 
#     and exit iteration 
# Convert digits back to a number and return that integer

def delete_digit(n)
  digits = n.digits.reverse
  delete_index = digits.each_with_index do |digit, index|
    next_digit = digits[index + 1]
    break index if next_digit.nil? || next_digit > digit
  end
  digits.delete_at(delete_index)
  digits.join.to_i
end


p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
