# Which are in?
# Given two arrays of strings, arr1 and arr2, return a new array that contains
#   all strings from arr1 that are substrings of any of arr2's strings.
# - The returned array should be sorted in alphabetical order (a->z)

# Input: Two Arrays, arr1 and arr2 - both containing strings
# Output: A new array, containing all strings from arr1 
#   that are a substring (included in) of at least one element in arr2

# Examples:
# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# in_array(a1, a2) == ["arp", "live", "strong"]

# a1 = ["tarp", "mice", "bull"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# in_array(a1, a2) == []

# Data:
# The two arrays of strings given as input, arr1 and arr2
# - Select from arr1 all elements that are a substring of any element in arr2
# select arr2.any? { |str2| str2.include? (str1 ) }

# Algorithm
# Given two arrays of strings as input, arr1 and arr2:
# Iterate through arr1 (selection). For each string of arr1, str1:
#   - Evaluate whether the current str1 is a substring of (included in) 
#     any string of arr2.
#   - If true, keep str1, otherwise don't
# -> Array of strings from arr1 that are a substring in arr2
# - Sort in ascending order a->z

def in_array(arr1, arr2)
  arr1.select do |str1|
    arr2.any? { |str2| str2.include?(str1) }
  end.sort
end


a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2) == ["arp", "live", "strong"]

a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2) == []