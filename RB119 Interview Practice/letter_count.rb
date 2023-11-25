# Letter Count
# Write a method that counts lowercase letters in a given string and returns
#   the count of each letter in a Hash
#   - key: the letter (symbol); value: the count of that letter

# Input: A string
# Output: A Hash 
# - containing key-value pairs where:
#   Key: Symbol representation of each character(?) in the string
#   Value: Integer representing how many times that character appears in the string.
# Rules/Questions:
#   - What should we do with non-letter characters? (ie. spaces/numbers/punctuation)
#   - What should we do with uppercase letters?
#   - The keys of the returned hash should be in alphabetical order

# Examples:
# letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
# letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
# letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# Data:
# The string given as input
# - Probably iterate over each character
# The hash returned as output
# - Increment values as we iterate over each character

# Algorithm:
# Given a string as input, str:
# Initialize a new hash (to be returned), default value = 0 (letter_counts)
# Iterate over each character of str. For each character:
#   Increment the corresponding value in letter_counts by 1
#   - If char already exists as a key, increment its value by 1
#   - If char doesn't exist yet, add it as a key-value pair (value 0)
#     and then increment by 1
# Return letter counts
# - Sort the key-value pairs by alphabetical value of the keys
#   in ascending order (a->z)

def letter_count(str)
  letter_counts = Hash.new(0)
  str.each_char do |char|
    letter_counts[char.to_sym] += 1
  end

  # optional sorting
  letter_counts.sort_by { |key, _value| key }.to_h
end


ALPHABET = Array('a'..'z')

def letter_count(str)
  str_letters = ALPHABET.select do |letter|
    str.include?(letter)
  end
  str_letters.each_with_object({}) do |letter, counts|
    counts[letter.to_sym] = str.count(letter)
  end
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
