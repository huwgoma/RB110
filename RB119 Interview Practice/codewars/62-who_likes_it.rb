# Who Likes it? 
# Write a method that takes an array of strings, containing the names of people 
# that like an item, and returns a string containing the 'like text'.

# Input: An array of strings (names)
# Output: A String representing who 'likes' something
# - If the array is empty -> 'no one'
# - If the array has 1 name -> 'name'
# - 2 names -> 'name and name' (and-separated)
# - 3 names -> 'name, name and name'
# - 4+ names -> 'name, name, and 2 others'

# Example:
# likes([]) == 'no one likes this'
# likes(['Peter']) == 'Peter likes this'
# likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
# likes(['Max', 'John', 'Mark']) == 'Max, John and Mark like this'
# likes(['Alex', 'Jacob', 'Mark', 'Max']) == 'Alex, Jacob and 2 others like this'

# Data:
# The array of names given as input
# - Empty => 'no one'
# - 1 => 'name'
# - 2 => 'name and name' (and)
# - 3 => 'name, name and name' (comma-separated + and)
# - 4+ =>'name, name, and -- others' 
# Format names, then concatenate to 'likes this' (0/1) / 'like this' (2+)
# - string_start / string_end

# Algorithm:
# Given an array of name strings as input, names:
# Determine the value of string_end: 
#   - if names size is greater than 1 -> 'like this'; otherwise, 'likes this'
# Determine the value of string_start:
#   If array is empty => 'no one'
#   If array is 1 => array.first
#   If array is 2 => array.first and array.last 
#   If array is 3 => array[0], array[1] and array[2]
#   Otherwise (4+) => array[0], array[1] and (array size - 2) others
# Concatenate string_start and string_end and return the resulting string

def likes(names)
  string_end = names.size > 1 ? 'like this' : 'likes this'
  string_start = case names.size
                 when 0 then 'no one'
                 when 1 then names.first
                 when 2 then "#{names.first} and #{names.last}"
                 when 3 then "#{names[0]}, #{names[1]} and #{names[2]}"
                 else        "#{names[0]}, #{names[1]} and #{names.size - 2} others"
                 end
  "#{string_start} #{string_end}"
end

p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
p likes(['Max', 'John', 'Mark']) == 'Max, John and Mark like this'
p likes(['Alex', 'Jacob', 'Mark', 'Max']) == 'Alex, Jacob and 2 others like this'
