# Mexican Wave
# Write a method that takes a string and returns an array of strings:
# - Each String will contain the same letters, but will have one character 
#   uppercased (starting from the first character, ending at the last character)
# Rules:
# - The input string will always be lowercase (may be empty)
# - If a character in the string is whitespace, skip over it

# Input: A String
# - contains lowercase characters and whitespace only 
# Output: An array of strings
# - each string contains a single uppercased character; starting from index 0, 
#     ending at the last index

# Examples:
# result = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# wave("hello") == result

# result = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
# wave("codewars") == result

# result = []
# wave("") == result

# result = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
# wave("two words") == result

# result = [" Gap ", " gAp ", " gaP "]
# wave(" gap ") == result


# Data:
# The string given as input
# - Iterate over each index of the string and create a new string that has the 
#   corresponding index character uppercased
#   - But skip if the current character is a space
# The array of strings returned as output.

# Algorithm:
# Given a string as input, str:
# Initialize new array, strings = []
# Iterate over each character of str with index. For each char/index:
#   If the current character is a space, skip to the next iteration 
#   Otherwise:
#   Create a copy of str, then change the character at the current index 
#     to its uppercase form.
#   Add the resulting new string to strings
# Return strings

def wave(str)
  strings = []
  str.each_char.with_index do |char, index|
    next if char == ' '
    copy_str = str.dup
    copy_str[index] = char.upcase
    strings << copy_str
  end
  strings
end



result = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("hello") == result

result = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("codewars") == result

result = []
p wave("") == result

result = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave("two words") == result

result = [" Gap ", " gAp ", " gaP "]
p wave(" gap ") == result