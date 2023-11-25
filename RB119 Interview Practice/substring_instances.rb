# Write a method that takes 2 string arguments, full_text and search_text, and
#   returns the number of times the search_text is found within the full_text.
# - Overlap is not permitted: 'aaa' only contains 1 instance of 'aa', not 2.

# Input: 2 Strings
# - full_text: The text to search through
# - search_text: The substring to search for within full_text

# Output: an Integer 
# - Represents how many times search_text appears in full_text
# - Each character in full_text can only be used once

# Examples:
# substring_instances('abcdeb','b') == 2
# substring_instances('abcdeb', 'a') == 1
# substring_instances('abbc', 'bb') == 1

# Data: 
# The full_string given as input
# - will probably need to iterate over characters 
# - from each character/index, check substrings of length (search_text)
# - If a matching substring is found, skip forward by length search_text
#   eg. 'abbc', 'bb' -> Index 0 (a) -> 'ab' (no match)
#                    -> Index 1 (b) -> 'bb' (match)
#       Skip to the index 2 places from current Index 1 -> Index 3
#                    -> Index 3 (c) -> 'c' (no match)
#       Index 4 -> Equal to string length, out of bounds (end)

# Algorithm:
# Given two strings as input, full_text and search_text:
# Initialize a new variable, matches = 0
# Initialize a loop and an index = 0. For each iteration:
#   Retrieve a substring from full_text, starting at the current index, 
#     taking <search_text length> number of characters.
#   If the substring matches search_text:
#     Increment matches by 1
#     Increment index by search_text length
#   Otherwise, increment index by 1
#   Exit loop when index equals or exceeds string length
# Return matches


def substring_instances(full_text, search_text)
  matches = 0
  index = 0
  while index < full_text.length
    substring = full_text.slice(index, search_text.length)
    if substring == search_text
      matches += 1
      index += search_text.length
    else
      index += 1
    end
  end
  matches
end


p substring_instances('abcdeb','b') == 2
p substring_instances('abcdeb', 'a') == 1
p substring_instances('abbc', 'bb') == 1
p substring_instances("aa_bb_cc_dd_bb_e", 'bb') == 2
