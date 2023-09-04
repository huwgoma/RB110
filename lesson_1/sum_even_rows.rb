# Sum Even Number Rows
# Imagine a sequence of consecutive even integers (starting with 2). The
# integers are grouped into rows - the first row contains 1 integer, the second
# row 2 integers, the third row 3 integers, and so on.
# Given an integer representing the number of a particular row, return an integer 
# representing the sum of all integers in that row.

# 2                   1
# 4 6                 2
# 8 10 12             3
# 14 16 18 20         4
# 22 24 26 28 30      5
# 32 34 36 38 40 42   6
# ...

# Problem:
# Input: Integer, representing the row number
#   - Represents the number of integers in the given row.
# Output: Another Integer, representing the sum of all integers in the given row.
# Rules: 
#   - Allowed to assume input will always be a valid Integer?
#   - What if the input is a non-positive Integer?
#   - Do all rows start with 2? (ie. does the sequence restart per row?) -> No

# Examples/Test Cases:
# sum_even_rows(1) == 2 
# sum_even_rows(2) == 10
# sum_even_rows(3) == 30
# sum_even_rows(4) == 68 

# Data: 
#   An Array of integers? For each row of integers
#   Nested Array - Each nested subarray represents each row.
#   eg. [[2], [4, 6], [8, 10, 12], ...]

# Algorithm:
# Given an Integer, row_number (3):
#   Build the Nested Array of Even Number Rows:
#     Initialize a new empty Array, even_number_rows = []
#     Initialize a new variable, int = 2
#     Iterate from 1 to row_number. For each number, num:
#       Build a new array row = [], 
#       then populate row with num # of even integers.
#       Initialize a loop. Until row.size is equal to num:
#       -> Append int to row, then increment int by 2.
#   Calculate the sum of the row_number'th array
#     Retrieve the subarray at row_number - 1 (index) and sum its elements
#   Return the sum.

# def sum_even_rows(row_number)
#   even_rows = create_even_rows(row_number)
#   even_rows[row_number - 1].sum
# end

# def create_even_rows(row_number)
#   rows = []
#   int = 0
#   1.upto(row_number) do |num|
#     row = []
#     row << int += 2 until row.size == num
#     rows << row
#   end
#   rows
# end

# p sum_even_rows(1) == 2 
# p sum_even_rows(2) == 10
# p sum_even_rows(3) == 30
# p sum_even_rows(4) == 68 





## REFACTOR!
# Refactor create_even_rows -> create_row:
#   Only create the necessary row, instead of the whole thing.
# Input: Integer, representing the row number to be created.
#   Also represents the number of elements in the row/array.
# Output: An array representing the row. 
#   Contains n number of even Integers where n = row_number,
#   and Integers are incremented by 2.
#   Starting Integer is equal to (row_number * previous row number) + 2
#     eg. row 5's starting Integer = (5 * 4) + 2 = 22

# Examples:
# create_row(1) == [2]
# create_row(2) == [4, 6]
# create_row(3) == [8, 10, 12]
# create_row(6) == [32, 34, 36, 38, 40, 42]

# Data: Array containing row_number number of even incrementing Integers

# Algorithm:
# Given an input Integer row_number:
#   Create a new empty array, row = []
#   Calculate the starting Integer. int = row_number * previous row number + 2 
#   Initialize a loop. Until row's size is equal to row_number: 
#     Append int to row, then increment int by 2.
#   Return row

def sum_even_rows(row_number)
  row = create_row(row_number)
  row.sum
end

def create_row(row_number)
  row = []
  int = (row_number * (row_number - 1)) + 2
  until row.size == row_number
    row << int
    int += 2
  end
  row
end

p sum_even_rows(1) == 2 
p sum_even_rows(2) == 10
p sum_even_rows(3) == 30
p sum_even_rows(4) == 68 