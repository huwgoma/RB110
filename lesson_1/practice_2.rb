# 1) Given the array below, turn this array into a hash, where the 
# names are the keys, and the indexes are the values.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Create a new empty hash, flintstones_hash
# Iterate over the flintstones array with index. For each name:
#   Add a new key value pair to flintstones_hash. fh[name] = index
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end


# 2) Add up all the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
  "Marilyn" => 22, "Spot" => 237 }
# Retrieve all values from ages Hash, then sum the values
ages.values.sum


# 3) Remove all people with age > 100 from the ages hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# Delete key-value pair if value > 100
ages.delete_if { |_name, age| age > 100 }


# 4) Retrieve the minimum age from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, 
  "Marilyn" => 22, "Spot" => 237 }
# Retrieve all values from ages Hash (Array), then find the minimum value from 
# values array.
ages.values.min


# 5) Find the index of the first name that starts with "Be":
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Beenie)
# Create a new variable first_index (index of first search instance)
# Iterate through array. with index. For each name:
#   If current name starts with "Be", reassign first index to current index
#   and stop looping.
# first_index = nil
# flintstones.each_with_index do |name, index|
#   if name.start_with?("Be")
#     first_index = index 
#     break
#   end
# end
# first_index

# Alternatively: Array#index (return index of first match) can take a block.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Beenie)
first_index = flintstones.index { |name| name.start_with?('Be') }
first_index


# 6) Change the array below so that all names are shortened to just the first 3 
# characters. Do not create a new array (ie. mutate the array)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Iterate through the flintstones array. For each name:
#   Replace each name with a new String containing only the first 3 characters
#   of the original String
flintstones.each_with_index do |name, index|
  flintstones[index] = name[0, 3]
end
flintstones
# Alternatively: transformation - Map over the flintstones array. For each name:
#   Return the first 3 characters of the name.
# Do not create a new array (ie. map!)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name[0, 3]
end
flintstones


# 7) Create a hash that expresses the number of occurences that each letter
# appears in this string:
statement = "The Flintstones Rock"
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
# Rules: Are uppercase and lowercase letters equivalent?
#        => No (T => 1)
#        Hash Keys are ordered by alphabetic value, caps first (A-Z, a-z)
#        Spaces are ignored.
# Algorithm:
# Create a new empty hash, letter_freq = {}. 
# Create an array of all letters (A-Z a-z)
# Iterate through letters. For each letter:
#   Count the number of occurrences of the current letter in the statement string.
#   Skip to next iteration if count is zero.
#   Perform key assignment on letter_freq hash (eg. freq[letter] = count)
# return letter_freq

letter_freq = {}
letters = Array('A'..'Z') + Array('a'..'z')
letters.each do |letter|
  count = statement.count(letter)
  letter_freq[letter] = count if count.positive?
end
letter_freq


# 8) What happens if you modify an array while iterating over it? 
# What will this code output?
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# #each iterates as long as i is less than the calling array's length
# eg. 
# i = 0
# while i < array.length
#   ...
#   i += 1
# end

# [1, 2, 3, 4]
# Iteration 1: i = 0. i(0) < arr.length (4)? true. 
#   p arr[0] -> 1; arr.shift -> [2, 3, 4]
# Iteration 2: i = 1. i(1) < arr.length (3)? true.
#   p arr[1] -> 3; arr.shfit -> [3, 4]
# Iteration 3: i = 2. i(2) < arr.length (2) ? false.
#   exit loop.

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
# Output: 1, 2


# 9) Rails provides a method String#titleize, which returns a string with each
# word capitalized.
# eg. "the flintstones rock".titleize #=> "The Flintstones Rock"
# Write your own version of this method in Ruby.

# Input: The calling String
# Output: A new String; each 'word' is capitalized.
# Rules:
#   - Do not mutate the caller; return a new string.
#   - A 'word' is delineated by a space. 
#   - Assume input is valid?
#   - Empty case: How to handle empty string caller?
#     => ''

# Ex: 
# words = 'the flintstones rock'
# words.titleize == 'The Flintstones Rock'
# words == 'the flintstones rock'

# Data:
#   Probably an Array (split String into words Array)
#   A new String to be returned

# Algorithm: 
#   Given a calling String, self:
# Split self into 'words' (ie. split by spaces).
# Iterate through the resulting words array. For each word:
#   Capitalize the first character of each word (destructively)
# Join the mutated words array together (with space)
# Return words

class String
  def titleize
    # self.split.map(&:capitalize).join(' ')
    words = self.split # [the, flintstones, rock]
    words.map { |word| word.capitalize } #=> [The, Flintstones, Rock] (new)
    words.join(' ') # words still points to [the, flintstones, rock]
  end
end

words = 'the flintstones rock'
words.titleize == 'The Flintstones Rock'
words == 'the flintstones rock'


# 10) Given the munsters hash below,
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash so that each member has an "age_group" key, pointing to one of
# three values (kid, adult, or senior)
# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Kid: Between 0 and 17 (inclusive)
# Adult: Between 18 and 64 (inclusive)
# Senior: 65+

# Algorithm: 
# Given a hash of hashes, munsters:
#   Iterate through the munsters hash. For each person-hash pair:
#   Calculate the age group of the current person:
#     if person[:age] is between 0 and 17 => age group 'kid'
#     if person[:age] is between 18 and 64 => age group 'adult'
#     if person[:age] is greater than/equal to 65 => 'senior'
#   Add age group to the current person's hash as a kv pair.
#     eg. person[:age_group] = age_group

munsters.each do |person, hash|
  age_group = case hash['age']
              when (0..17)
                'kid'
              when (18..64)
                'adult'
              else
                'senior'
              end
  hash['age_group'] = age_group
end

munsters