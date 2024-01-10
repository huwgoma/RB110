# Find All Pairs
# Given an array of integers, count all pairs in that array and return 
#   the count of pairs 
# - Arrays can be empty or only contain one value; return 0 in this case.
# - Each element should only be used once:
#   eg. [0, 0, 0, 0] => 2 ([0, 0] and [0, 0])

# Input: An array of integers
# Output: An integer
# - Represents the number of pairs in the given array
# - Each element only counts towards one pair max

# Examples:
# pairs([1, 2, 5, 6, 5, 2]) == 2
# pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
# pairs([1000, 1000]) == 1
# pairs([]) == 0
# pairs([54]) == 0

# Data:
# The Array of integers given as input
# - Iterate through each unique value of `integers`. 
#   - Count the number of occurrences of that unique value in the 
#     original `integers` array, then divide by 2 (int div)
#   - Add the counts up -> Total count of pairs

# Algorithm:
# Given an array of integers as input, `integers`:
# Create a new array containing only the unique values of integers.
# (Transform) Iterate through unique integers. For each uniq_int:
#   Count the number of times the current unique int appears in `integers`, 
#   then divide that number by 2
# -> Array of pair counts for each unique integer in `integers`
# -> Calculate the total sum of pair counts

def pairs(integers)
  integers.uniq.map do |uniq_int|
    integers.count(uniq_int) / 2
  end.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
