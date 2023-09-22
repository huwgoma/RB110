# 1) How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']
# Transform the array into an array of integers.
# Sort the array in descending order (reverse order of comparison)
# Transform the array back into an array of strings
# Using sort_by:
#   Return value of the block should be an integer (string.to_i)
#   Descending order? eg. 11 -> 10
#   Default Int<=> sorts in ascending order. 
#   Transform each element into a NEGATIVE integer. eg. -11 -> -10 (ascending)
arr.sort_by { |str| -(str.to_i) }


# 2) How would you order this array of hashes based on the publication of each 
#    book, from earliest to latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
# Sort the array of hashes BY each hash's `published` value converted to an 
# Integer.
books.sort_by { |book| book[:published].to_i }


# 3) For each of these collection objects, how would you reference 'g'?
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g'] ] ]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]


# 4) For each collection object where the value 3 occurs, how would you change 
#    3 to 4?
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4


# 5) Given this nested Hash, determine the total age of all male family members.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Initialize a new variable, total_male_age = 0
# Iteration: Iterate through the munsters hash. For each person, 
#   name => attributes:
#   if the current person's gender is male, add their age to total_male_age
total_male_age = 0
munsters.each do |_name, attributes| # Hash#each_value
  if attributes['gender'] == 'male'
    total_male_age += attributes['age']
  end
end
total_male_age


# 6) Given this nested Hash, print out the name, age, and gender of each person.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# eg. <Name> is a <age>-year-old <male or female>.
# Iterate through the munsters hash. For each person, name => attributes:
#   Create a string to be printed with string interpolation.
#   <name>: name  ;   <age>: attributes['age']  ;   <male/female>: attributes['gender']
#   Print the string.
munsters.each do |name, attributes|
  #puts "#{name} is a #{attributes['age']}-year-old #{attributes['gender']}."
end 


# 7) Given this code, what are the final values of a and b? 
a = 2
b = [5, 8]
arr = [a, b] # arr = [2, [5, 8]]

arr[0] += 2 # arr => [4, [5, 8]]
arr[1][0] -= a # arr => [4, [3, 8]]

# a's value will remain 2, as it was never reassigned.
# b's value will be [3, 8]. Line 6 mutates the element at index 1 of `arr`
#   (the array object [5, 8]), using the mutating indexed assignment method
#   to reassign the index 0 element to itself minus a (5 - 2 => 3). Because 
#   this operation mutates the array itself, this change will be reflected in
#   all variables/pointers referencing that array (`b` and `arr[1]`)


# 8) Using the each method, output all vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], 
       third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# Define a new array of vowels aeiouAEIOU
# Iterate over the hash. For each key-array pair:
#   Iterate over the array. For each string:
#     Iterate over each character of the string. For each char:
#       If current char is included in vowels, print char
vowels = %w(a e i o u A E I O U)

hsh.each_value do |arr|
  arr.each do |str|
    str.each_char do |chr|
      #puts chr if vowels.include?(chr)
    end
  end
end


# 9) Given this data structure, return a new array of the same structure, but 
#    with the subarrays ordered in descending order. 
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#   eg. => [[c, b, a], [3, 2, 1], [green, blue, black]]
#   Sorting each subarray's contents in descending order.

# Create an empty array, result = []
# Iterate through the top-level array. For each subarray, subarr:
#   Sort the subarray in descending order (reversed <=>)
#   Add the (new) sorted subarray to the result array
# Anytime you're creating a new collection and adding an element to it for each
# element of the original collection => Transformation => Look to #map.

# ie. This...
# result = []
# arr.each do |subarr|
#   result << subarr.sort { |a, b| b <=> a }
# end

# Can be rewritten like so:
arr.map do |subarr|
  subarr.sort { |a, b| b <=> a }
end


# 10) Given the following data structure, use #map to return a new array, 
# identical in structure but with each integer value incremented by 1.
#   Do not mutate the original array.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# eg. => [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

# Create a new empty array, result = []
# Iterate over arr. For each hash:
#   Create a new empty hash, result_hash = {}
#   Iterate over the current hash. For each key-value pair:
#     Add a new key value pair to result_hash. result_hash[key] = value + 1
#   Return result hash 

arr.map do |hsh|
  result_hash = {}
  hsh.each do |key, value|
    result_hash[key] = value + 1
  end
  result_hash
end


# 11) Given the following array, return a new array that is identical in structure
# but only contains the integers that are multiples of 3.
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
# eg. => [[], [3, 12], [9], [15]]
# Transformation: Iterate through the top-level array. For each subarray:
#   Selection: Iterate through the current subarray. For each integer:
#     Check if the current integer is divisible by 3. If it is, select it; 
#     otherwise, reject it.
#   Return a new array containing all selected integers (return to transformation)

arr.map do |subarr|
  subarr.select do |int|
    (int % 3).zero?
  end
end


# 12) Given the following array, return a hash where the key is the first item
# in each subarray, and the value is the second item.
#   - Do not use the Array#to_h method.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# eg. => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# Create a new empty hash, hash = {}
# Iterate through the top-level array. For each subarray:
#   Create a new key-value pair in hash. 
#   Key = subarray.first; Value = subarray[1] (second)
# Return hash.
arr.each_with_object({}) do |subarr, hash|
  hash[subarr.first] = subarr[1]
end


# 13) Given the following data structure, return a new array containing the same
# subarrays, sorted using only the odd numbers within each subarray.
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
# eg. => [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
# [1, ..., 3], [1, 5, 9], [..., 1, 7], [1, ..., 9]

# Sorting the top level array by the contents of the subarrays:
# Sort top-level array by:
#   Subarrays, where only the odd numbers exist (Selection)

arr.sort_by do |subarr|
  subarr.select(&:odd?)
end


# 14) Given this hash, return an array containing fruit colors (capitalized)
# and vegetable sizes(uppercased)
# - Do not mutate the original hash.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# eg. => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Transformation: Iterate over the top-level hash. For each fruit/vegetable,
#   name, attributes:
#   If attributes[type] is a fruit, retrieve attributes[colors], then return a 
#     transformed array of color strings (capitalize each string)
#   If attributes[type] is a vegetable, retrieve attributes[size], then return 
#     a new string (size upcased)

result = hsh.map do |_name, attributes|
  if attributes[:type] == 'fruit'
    attributes[:colors].map(&:capitalize)
  else
    attributes[:size].upcase
  end
end


# 15) Given this data structure, return a new array that only contains the 
# hashes where all integers are even.
arr = [ {a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]} ]
# eg. => [ { e: [8], f: [6, 10] } ]

# Selection: Iterate over the top-level array. For each element, hash:
#   Select the current hash only if ALL values of the current hash (arrays of 
#   integers) contain ALL even numbers.

#   Iterate through the current hash. For each key value pair, key, array:
#     Iterate through the current array. For each integer:
#       If all integers are even, return true. otherwise return false.
#     If all iterations of the current hash return true, return true. 
#     otherwise return false.

arr.select do |hash|
  hash.all? do |key, array|
    array.all?(&:even?)
  end
end


# 16) A UUID consists of 32 (hexadecimal) characters, and is divided into 5 
# sections: 8 chars-4 chars-4 chars-4 chars-12 chars; represented as a String.
# Write a method that returns one UUID (no parameters)
# eg. => "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Hexadecimal characters: 0-9, a-f

# Create an array of valid hexadecimal characters to sample from. 
# Create an array of integers, 8 4 4 4 12.
# Transformation: Iterate through integers. For each integer:
#  Replace each integer with a string of int length:
#   Create a new empty string, str = ''
#   For int # of times, randomly sample a character from the hexdec array and 
#     append it to str. 
#   Return the string (for #map)
# Join array items together with '-' separator.

def generate_uuid
  hd_chars = Array('0'..'9') + Array('a'..'f')
  hd_template = [8, 4, 4, 4, 12]

  hd_template.map do |int|
    str = ''
    int.times { str << hd_chars.sample }
    str
  end.join('-')
end

p generate_uuid