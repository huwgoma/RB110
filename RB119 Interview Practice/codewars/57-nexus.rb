# Find the Nexus of the Codewars Universe
# Write a method that takes a Hash of users and find the -nexus-
# - Nexus: The user whose rank is the closest to being equal to their honor.
# - For each user, the key is the rank, and the value is the honor
# - Return the rank of the nexus user.
# If no one has an exact rank/honor match, return the rank of the user who comes 
#   the closest. If several users come closest, return the one with the lowest
#   rank.

# Input: A Hash of users:
#   - Key: User's rank; Value: User's honor
# Output: The rank of the user whose honor is the closest to their rank
# - If more than one user has equal rank-honor proximity, return the lower-ranked
#   user's rank

# Example:
#          rank    honor
# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,    <--- nexus
#           23  =>  11,
#           30  =>   2 }
# nexus(users) == 20 

# users_2 = { 20 => 19, 3 => 4 }
# nexus(users_2) == 3

# Data:
# The Hash given as input
# - Sort the Hash by rank in ascending order (lowest ranks come first)
# - Find the minimum user by the absolute value of difference b/w rank and honor
#   - Since hash is sorted, if two deltas are the same, we will return the 
#     one that comes first (which is the lower ranked one)

# Algorithm:
# Given a Hash as input, users:
# Sort the hash by rank, in ascending order (so that lowest ranks are first)
# Find the key-value pair (user) that has the SMALLEST difference (absolute 
#   value) between their key (rank) and their value (honor)
# => [rank, honor]
# Return the rank (key) of that user

def nexus(users)
  sort_by_rank = users.sort.to_h
  sort_by_rank.min_by { |rank, honor| (rank - honor).abs }.first
end

users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    # <--- nexus
          23  =>  11,
          30  =>   2 }
p nexus(users) == 20 

users_2 = { 20 => 19, 3 => 4 }
p nexus(users_2) == 3
