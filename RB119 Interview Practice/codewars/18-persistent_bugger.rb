# Persistent Bugger
# Write a method, persistence, that takes a positive integer `num` and returns 
#   its multiplicative persistence
#   - The number of times you need to multiply the digits in `num` until you
#     reach a single digit.

# Input: An integer, `num`
# Output: Also an integer
# - Represents the number of times we need to multiply `num`'s digits to reach a 
#   single-digit number
#   (Assumption of reassigning `num` to the result of each multiplication)

# Examples:
# 39: 3*9 => 27; 2*7 => 14; 1*4 => 4 (single digit)

# persistence(39) == 3
# persistence(4) == 0 # already is one-digit
# persistence(25) == 2 
# persistence(999) == 4
# persistence(444) == 3

# Data:
# The integer given as input, num
# - Probably split num into an array of its digits 
#   - Then calculate the product of all digits and reassign num to the product
#   - Until digits size is only one

# Algorithm:
# Given an integer as input, num:
# Initialize a counter variable, counter = 0
# Initialize a loop; until num only contains one digit (num.to_s.size == 1):
#   Split num into an array of its digits.
#   Calculate the product of the digits
#   Reassign num to that product.
#   Increment counter by 1

def persistence(num)
  counter = 0
  until num.to_s.size == 1
    num = num.digits.reduce(:*)
    counter += 1
  end
  counter
end


p persistence(39) == 3
p persistence(4) == 0 # already is one-digit
p persistence(25) == 2 
p persistence(999) == 4
p persistence(444) == 3
