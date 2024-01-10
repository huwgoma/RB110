# Where is my Parent?
# Given a party with only mothers and their children:
# - Uppercase letters stand for mothers and lowercase letters stand for their children
#   - eg. 'A' is the mother of children 'aaaa'

# Write a method that takes a string and returns a new string where the mothers
#   (uppercase) are followed by their children (lowercase)
# - Assume that the string will contain only letters, and that uppercase letters
#   will be unique.

# Input: A String
# - Containing uppercase letters (moms) and lowercase letters (children)
# Output: A new string
# - Containing the same letters, but organized such that lowercase letters
#   follow the corresponding uppercase letter.
# - The string should be in alphabetical order.

# Examples:
# 'aAbaBb' => 'AaaBbb'
# find_children("abBA") == "AaBb"
# find_children("AaaaaZazzz") == "AaaaaaZzzz"
# find_children("CbcBcbaA") == "AaBbbCcc"
# find_children("xXfuUuuF") == "FfUuuuXx"
# find_children("") == ""

# Data:
# The String given as input
# - Need to build a new string as output

# Algorithm:
# Given a string as input, str:
# Count the number of children for each mother (uppercase letter)
#   - ie. Count the number of lowercase letters for each uppercase letter.
#   Initialize a new Hash, mother_children = {}
#   Iterate through each character of str. For each character:
#   - If character is uppercase (matches /[A-Z]/), create a new entry in mother_children
#   - Otherwise (if char is lowercase), increment the value corresponding to the 
#     uppercased key (eg if a, increment mother_children[A] by 1)
# Iterate through each mother-children count pair and concatenate
#   mother+children_count*mother.downcase 

# def find_children(str)
#   child_count = str.chars.each_with_object(Hash.new(0)) do |char, children|
#     children[char.upcase] += 1 unless char.match?(/[A-Z]/)
#   end.sort.to_h

#   child_count.each_with_object('') do |(mother, children), result|
#     result << "#{mother}#{mother.downcase * children}"
#   end
# end

# p find_children("abBA") == "AaBb"
# p find_children("AaaaaZazzz") == "AaaaaaZzzz"
# p find_children("CbcBcbaA") == "AaBbbCcc"
# p find_children("xXfuUuuF") == "FfUuuuXx"
# p find_children("") == ""


# Algorithm:
# Create an array of each uppercase letter (sorted)
# Iterate through mothers. For each mother, count the number of their children 
#   (mother.downcase) and append that many children to the string (with mother)

def find_children(str)
  mothers = str.chars.select { |chr| chr.match?(/[A-Z]/) }.sort

  mothers.each_with_object('') do |mother, result|
    number_of_children = str.chars.count { |chr| chr == mother.downcase }
    result << "#{mother}#{mother.downcase * number_of_children}"
  end
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

# sort by array [1, 2]
# put all As to the front
# then put the capital A to the front of the As