# Given an array of numbers, for each number, find out how many numbers
# in the array are smaller than the current number.
# - When counting numbers, only count the values that are unique. 
# ie. If a given number occurs multiple times in the array, it should only 
#   be counted once.

# Input: An array of numbers
# Output: A new array of numbers
# - Each integer in the output array represents the number of integers
#   in the original array that are smaller than the original integer at
#   the corresponding index.
#   (But only unique values)
# eg. [8, 1, 2, 2, 3] => [3, 0, 1, 1, 2]
#   4 elements are smaller than 8: 1, 2, 2, 3 - but only 3 are unique (1, 2, 3)
#   So 3 is the end value that is returned at index 0.

# Examples:
# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# Data: 
# - The array of integers given as input
# - The array of 'unique smaller than' counts returned as output
# Might have to iterate through the array of integers
# - Transform each value to the count of unique integers smaller than the 
#   current integers
# - Unique? -> Select all integers smaller than current integer, then uniq it. 

# Algorithm:
# Given an array of integers as input, integers:
# (Transform) Iterate over integers. For each integer:
#   Create an array of all integers within integers that are smaller than the 
#     current integer (selection)
#   Remove all duplicate values (leave only one of each unique value)
#   Count the size of the remaining array
#   => Integer, collected into the returned array

def smaller_numbers_than_current(numbers)
  numbers.map do |number|
    numbers.select { |num| num < number }.uniq.size
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]