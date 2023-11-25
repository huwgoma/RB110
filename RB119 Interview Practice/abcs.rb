# Now I know my ABCs
# A collection of spelling 'blocks' has two letters per block, as shown below:
# B:O, X:K, D:Q, C:P, N:A, G:T, R:E, F:S, K:W, H:U, V:I, L:Y, Z:M
# Constructing any string from this set of letter blocks will only allow you to
#   use each letter block once. 
#   eg. If 'B' is used, 'O' cannot be used.

# Write a method that returns true if the given string can be spelled by 
#   using the specified letter blocks; false otherwise.

# Input: A String
# Output: A Boolean
# - True if the given string can be constructed with the specified letter blocks
# - False otherwise

# Examples:
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
#   # U and H are part of the same letter block, so they cannot be used together
# block_word?('jest') == true

# Data:
# The string given as input
# - Probably iterate over each character of the string
# Some sort of data structure to hold the 'letterblocks'; 
# - Maybe an array? eg. ['BO', 'XK', 'DQ', ...]
# - For each character, retrieve the corresponding letterblock (eg. 'B' => 'BO')
#     and add it to an array of the string's letterblocks?
# - Then check if there are any duplicates (or check after each iteration)

# Algorithm:
# Given a string as input, str:
# Define an array of associated letterblocks: ['BO', 'XK', 'DQ', ...]
# (Transform) Iterate over each character of str. For each char:
#   Retrieve the letterblock corresponding to the current char
# => Array of letterblocks used by the string
# Check if there are any duplicate letterblocks.

LETTERBLOCKS = ['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 
  'JW', 'HU', 'VI', 'LY', 'ZM']

def block_word?(str)
  str_blocks = str.upcase.chars.map do |char|
    LETTERBLOCKS.find { |block| block.include?(char) }
  end
  str_blocks.uniq == str_blocks
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
  # U and H are part of the same letter block, so they cannot be used together
p block_word?('jest') == true


# Algorithm:
# Iterate over letterblocks. For each letterblock:
# Count how many times either letter appears in str.
#   eg. 'HU' appears twice in 'BUTCH'; 'U' appears once, 'H' appears once
# If any count is greater than 1, return false
# ie. If all counts are less than/equal to 1, return true
#     If none of the counts are greater than 1, return true

def block_word?(str)
  LETTERBLOCKS.all? do |block|
    str.count(block) <= 1
  end
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
  # U and H are part of the same letter block, so they cannot be used together
p block_word?('jest') == true