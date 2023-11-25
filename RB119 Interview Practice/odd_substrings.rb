# Non-Even Substrings
# Given a string of integers, return the number of odd-numbered substrings
# that can be formed. 

# Input: A String 
# - Assume the string will only contain integers
# Output: An integer
# - Represents the number of odd-numeric value substrings that can be formed.

# Examples:
# '1341' => 1, 13, 1341, 3, 341, 41, 1 => 7 odd numbers can be formed
# odd_substrings("1341") == 7
# odd_substrings("1357") == 10
# odd_substrings("13471") == 12
# odd_substrings("134721") == 13
# odd_substrings("1347231") == 20
# odd_substrings("13472315") == 28

# Data:
# The string of integers given as input
# - Maybe create an array of all substrings 
# - And then filter substrings for only those which have a odd numeric value

# Algorithm:
# Given a string of integers as input, str:
# Create an array of all possible substrings from str:
#   Create new array, substrings = []
#   Iterate over each index of str. For each index:
#     Loop from 1 up to <str length - index>. For each length:
#     Create a substring, starting from index, taking <length> 
#       number of characters.
#     Add substring to substrings array
#     Return substrings
# (Select) Iterate over substrings and select only the substrings that have
#   an odd numeric value.
# Calculate the size (number of elements) of the odd-filtered array

def odd_substrings(str)
  substrings = substrings(str)
  substrings.select { |str| str.to_i.odd? }.size
end

def substrings(str)
  substrings = []
  str.chars.each_index do |index|
    1.upto(str.length - index) do |length|
      substrings << str[index, length]
    end
  end
  substrings
end


p odd_substrings("1341") == 7
p odd_substrings("1357") == 10
p odd_substrings("13471") == 12
p odd_substrings("134721") == 13
p odd_substrings("1347231") == 20
p odd_substrings("13472315") == 28