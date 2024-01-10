# Ten Minute Walk
# Given an array of strings representing a direction to talk (eg. [n, s, w, e])
# - For each direction letter, you will walk exactly 1 minute.
# Return true if the given array of directions will return you to the starting 
#   point in exactly 10 minutes
# - False otherwise.

# Input: An array of strings
# - Each string represents a direction to walk in, for 1 minute.
# Output: A boolean
# - True if the given array of directions returns you to the starting point [0, 0]
#   in exactly 10 minutes
#   - 10 minutes; each direction occupies 1 minute.
# - False otherwise

# Examples:
# is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
# is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
# is_valid_walk(['w']) == false
# is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
  
# Data:
# The array of direction strings given as input
# Since each direction takes exactly 1 minute, there should be exactly 10 directions

# Algorithm:
# Given an array of strings as input, directions:
# If directions does not contain exactly 10 elements, return false.
# Otherwise:
# Count the number of 'n' and 's', and 'w' and 'e'
# - n count should be equal to s count, and w count == e count
# Verify that all values of the current location are zero.

# def is_valid_walk(directions)
#   return false unless directions.size == 10

#   directions.count('n') == directions.count('s') &&
#     directions.count('e') == directions.count('w')
# end


# p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
# p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
# p is_valid_walk(['w']) == false
# p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false



# Algorithm ( { x: 0, y: 0 } version ):
# Use a hash to keep track of our current location.
# Iterate through directions. For each direction:
#   - Increment/decrement the corresponding x/y value appropriately.
# Verify that all values (x/y) are 0

def is_valid_walk(directions)
  return false unless directions.size == 10
  
  location = { x: 0, y: 0 }
  directions.each do |direction|
    case direction
    when 'n' then location[:y] += 1
    when 's' then location[:y] -= 1
    when 'e' then location[:x] += 1
    when 'w' then location[:x] -= 1
    end
  end
  location.values.all?(&:zero?)
end


p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false