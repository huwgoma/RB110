# Largest Product
# Write a method largest_product that takes a string of digits and returns the 
#   greatest product of five consecutive digits
# - Assume the input string will always have more than 5 digits.

# Input: A String containing digits (integers) - at least 5
# Output: An Integer
# - represents the greatest possible product that can be formed from 
#   5 consecutvie digits in the given string.

# Examples:
# p greatest_product('123456') == 720 # (2, 3, 4, 5, 6)
# p greatest_product("123834539327238239583") == 3240
# p greatest_product("395831238345393272382") == 3240
# p greatest_product("92494737828244222221111111532909999") == 5292
# p greatest_product("92494737828244222221111111532909999") == 5292
# p greatest_product("02494037820244202221011110532909999") == 0

# Data:
# The string of digits given as input
# - maybe create an array of all 5-character substrings that can be obtained from 
#   digits

# Algorithm:
# Given a string of digits as input, str:
# Create an array of all possible 5-character substrings of str:
#   - Iterate over each index of str. For each index:
#     - Take a 5-character substring from str, startin gfrom index
#     Exit iteration if the substring is less than 5 characters
#     - Otherwise, add the substring to substrings array
# (transform) iterate over 5-char substrings. For each substring:
#   Convert the substring to a number, then split the number into its digits,
#     then calculate the product of those digits.
#   => An array of integer products 
# - Find the max product in the resulting array of products

def greatest_product(str)
  substrings = n_length_substrings(str, 5)
  substrings.map do |substr|
    substr.chars.reduce(1) do |product, char|
      product *= char.to_i
    end
  end.max
end

# def greatest_product(str)
#   substrings = n_length_substrings(str, 5)
#   substrings.map do |substr|
#     substr.chars.map(&:to_i).reduce(:*)
#   end.max
# end

def n_length_substrings(str, substr_length)
  substrings = []
  str.chars.each_index do |index|
    substring = str[index, substr_length]
    break if substring.length < substr_length
    substrings << substring
  end
  substrings
end

p greatest_product('123456') == 720 # (2, 3, 4, 5, 6)
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0