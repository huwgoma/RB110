# Exponent Method
# Create a method that takes two integers and returns the value of the first integer
#   raised to the power of the second integer.
# - If the second argument is negative, return nil (fraction?)
# - Do not use the ** method.

# Input: Two Integers (Base and Exponent)
# Output: An integer
# - The result of raising the first integer to the power of the second
# - base ^ exponent (but ** is disabled)

# Examples:
# power(2, 3) == 8
# power(10, 0) == 1 # Raising to 0 => 1
# power(-5, 3) == -125 
# power(4, -2) == nil # fraction?

# Data:
# The two integers given as input (base/exponent)
# - If exponent is negative, return nil
# A variable to store the result of each intermediate multiplication step
# Multiply base x base exponent # of times
# - Start at 1 (Multiplicative identity)

# Algorithm:
# Given two integers as input, base and exponent:
# Return nil if exponent is negative
# Initialize a new variable, result = 1
# Initialize a loop (loop exponent # of times). For each loop:
#   - Multiply result by base, then assign to result
# Return result

def power(base, exponent)
  return nil if exponent.negative?

  power = 1
  exponent.times { power *= base }
  power
end

p power(2, 3) == 8
p power(10, 0) == 1 # Raising to 0 => 1
p power(-5, 3) == -125 
p power(4, -2) == nil # fraction?

# Reduce
# def power(base, exponent)
#   return nil if exponent.negative?

#   # Create an array with `exponent` number of `base` integers
#   # eg. [5] * 2 => [5, 5] => 5 * 5
#   ([base] * exponent).reduce(:*) || 1
# end

# p power(2, 3) == 8
# p power(10, 0) == 1 # Raising to 0 => 1
# p power(-5, 3) == -125 
# p power(4, -2) == nil # fraction?
