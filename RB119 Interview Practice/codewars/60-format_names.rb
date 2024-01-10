# Format a String of Names
# Write a method that takes an array of hashes, where each hash contains 
#   a name: 'string' key-value pair, and returns a string containing each name, 
#   separated by commas, except the last two names (which should be separated
#   by an ampersand &)

# Input: An array of hashes
# - Each hash contains one key-value pair: 
#   - name: 'name'
# Output: A String
# - Contains each name value, comma-separated; the last two names are separated by 
#   an ampersand instead

# Examples:
# list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'}]) == 'Bart, Lisa & Maggie'
# list([ {name: 'Bart'}, {name: 'Lisa'} ]) == 'Bart & Lisa'
# list([ {name: 'Bart'} ]) == 'Bart'
# list([]) == ''

# Data:
# - The Array of hashes given as input
# - Will need to extract each hash's [:name] string (array of names?)
# - Join names together using a comma and space
# - Replace the last comma with a space + ampersand

# Algorithm:
# Given an array of name hashes as input, hashes:
# Extract the name values into an array of names:
#   (Transform) Iterate through the array. For each hash:
#   - Return the value of each hash
#   => Array of name (string) values
# Join names together using a comma and space
# Replace the last comma with a space and ampersand
# - Find the index of the last comma
# - Replace the character at that index with ' &'

def list(name_hashes)
  names_str = name_hashes.map { |hash| hash[:name] }.join(', ')
  last_comma_position = names_str.rindex(',')
  return names_str if last_comma_position.nil?

  names_str[last_comma_position] = ' &'
  names_str
end

p list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'}]) == 'Bart, Lisa & Maggie'
p list([ {name: 'Bart'}, {name: 'Lisa'} ]) == 'Bart & Lisa'
p list([ {name: 'Bart'} ]) == 'Bart'
p list([]) == ''
