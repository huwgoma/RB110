# Find the Mine!
# Write a method that takes a nested 2D array (representing a NxN field)
# and returns the location of the single mine within the field.
#   - The mine is represented as the Integer 1 within the 2D array; tiles that
#     are safe are represented as 0s.
# - The location should be returned as an array [int, int]
#   - The first element is the row index
#   - The second element is the column index 

# Input: A nested 2D array, representing a minefield
# - Each array contains N number of integers;
#   - 0 represents a safe tile, 1 represents the mine
# Output: An Array 
# - Represents the x/y (row/column) coordinates of the mine (using a 0-based
#   index)

# Examples:
# mine_location([1, 0], [0, 0])
# 1 0
# 0 0 
# The mine is located in the first row and first column -> [0, 0]

# mine_location( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ])
# 0 0 0
# 0 1 0
# 0 0 0 
# The mine is located in the second row, second column -> [1, 1]


# Data:
# The 2D array given as input, representing the minefield structure
# - Iterating through the top-level array (exposing subarrays) -> Each row
# - Iterating through each subarray (exposing integers) -> Each column
# Maybe iterate through the top-level array (row), then iterate through each
#   subarray (column), both with index. 
#   - When the current integer is 1, return an array with the row index and 
#     column index

# Algorithm:
# Given a 2D array as input, minefield:
# Iterate through each row of the minefield (w/ index). For each row:
#   Iterate through each column (integer) of the row (w/ index). For each column:
#     If the current integer is 1, return [row index, column index]

def mine_location(minefield)
  minefield.each_with_index do |row, row_index|
    row.each_with_index do |int, column_index|
      return [row_index, column_index] if int == 1
    end
  end
end

p mine_location([ [1, 0], [0, 0] ]) == [0, 0]
p mine_location([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mine_location([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]