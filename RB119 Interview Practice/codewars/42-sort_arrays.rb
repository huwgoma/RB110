# Sort Arrays (Ignoring Case)
# Write a method that sorts the given array of strings in alphabetical order, 
#   case-insensitive. 

# Input:
#   An Array of strings
# Output: 
#   A new Array (?) of the same strings, sorted in alphabetical order (a->z)
#   - Case does not matter (so 'A' is equal to 'a' for sorting purposes;
#     preserve insertion order if equal)

# Examples:
# ["Hello", "there", "I'm", "fine"] => ['fine', 'Hello', "I'm", 'there']
# sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
# sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
# sortme(["CodeWars"]) == ["CodeWars"]

# Data:
# The array of strings given as input
# - Sort the array by the result of converting each string to downcase (to 
#   enforce case-insensitivity)

# Algorithm:
# Given an array of strings as input, strings:
# Sort strings by the result of transforming each string to its lowercase form

def sortme(strings)
  strings.sort_by(&:downcase)
end


p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]