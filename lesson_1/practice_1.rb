# 1)
# What is the return value of the select method? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# The return value of the select method will be a new Array containing 3 Integers, 
# [1, 2, 3]. This is because the select method returns a new collection of the 
# caller's type (so an Array in this case), and it selects elements to add to the
# returned Array based on the truthiness of the block's return value for each 
# element. Since the last expression of the block is the string 'hi', and strings 
# are considered truthy, every element in the calling Array will be selected and
# returned.


# 2)
# How does count treat the block's return value? How can we find out?
# ie. What does count do with the block's return value?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# The count method (with a block) returns an Integer representing the number of
# elements in the calling collection for which the block returns a truthy value.
# ie. Think of it like calling <collection>.select {...}.size
# Therefore count will use the block's return value to increment its internal
# counter representing how many elements the block returns a truthy value for.
# We can find out by doing something like this:
['ant', 'bat', 'caterpillar'].count do |str|
  nil
end
# Which should return 0, since all block executions will now return nil (falsey).
# or: 
['ant', 'bat', 'caterpillar'].count do |str|
  true
end
# Which should return an Integer equal to self.size, since all block executions 
# will now return true.


# 3) 
# What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
  puts num
end
# The reject method is the opposite of select - it returns a new collection (same
# type as caller) containing all elements from the caller for which the block returns
# a FALSEY value. 
# ie. Think of it like "Reject all elements that meet this criteria; keep only
# the elements that do not meet the criteri"
# Therefore, reject will return a new array containing [1, 2, 3] - because the last
# evaluated expression of the block is `puts num`, which always returns nil, the 
# block will return nil (a falsey value) for all three elements.


# 4)
# What is the return value of each_with_object in the following code? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  # value => ant, bear, cat
  hash[value[0]] = value
  # {}[ant[0]] = ant
  # {}['a'] = 'ant'
end
# each_with_object will return the following Hash:
# { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }
# each_with_object takes a method argument, which is the empty hash {}. Within each
# block invocation, the second block parameter `hash` is assigned to this same
# hash object. On Line 59, we are performing element assignment on this hash, 
# using the first character of whatever String `value` currently references (which
# will be 'ant', 'bear', and then 'cat') as the key, and the whole `value` String
# as the value.


# 5) 
# What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift
# Hash#shift removes the first key-value pair in the calling Hash (based on
# insertion order) and returns it in a two-element array.
# eg. hash.shift #=> [:a, 'ant']
#     hash #=> { b: 'bear' }
# Find out by checking docs?


# 6) 
# What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size
# This statement will return the Integer 11. Array#pop removes and returns the 
# last element in the calling Array (the String 'caterpillar'); String#size 
# returns an Integer representing the number of characters in the calling String.


# 7) 
# What is the -block-'s return value? How is it determined? What is the return
# value of any? in this code? What does this code output? 
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# This block will return true; the #any? method will return true; and this code
# will output 1.
# On the first iteration, the local block variable `num` is assigned to the first
# element of the calling Array (1). Line 96 will print the current value of `num`,
# which is 1. Line 97 evaluates to true, since 1 is an odd number. Since this is
# the last expression within the block, `true` will be implicitly returned from
# the block.
# The #any? method only checks to see if any block invocation will return a truthy 
# value. Since the first invocation returned a truthy value (true), the method will
# stop iterating and return true - hence why we only get one line of output, since
# iteration stops after the first loop.  


# 8) How does take work? Is it destructive?
arr = [1, 2, 3, 4, 5]
arr.take(2)
# #take creates a new Array formed by taking (non-destructively) the first n
# elements of the calling Array. 
# ie. This code will return a new Array containing [1, 2] - the first 2 elements
# of `arr`.


# 9) What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# map will return a new Array containing the return values of the block invocation
# for each element of the calling collection. 
# ie. => [nil, 'bear']
# On the first iteration, `value` is assigned to the string 'ant', which is not 
# longer than 3, so the if branch is not executed. Since there is no other code in 
# the block, `nil` is returned from the block.
# On the second iteration, `value` is assigned to the string `bear`, which IS 
# longer than 3, so the if branch is executed, which simply evaluates and then 
# implicitly returns `value` (ie. the string 'bear').
# map collects these return values from the block into a new array - hence the return
# value of a new Array, [nil, 'bear']


# 10) What is the return value of the following code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# The return value of this code is a new Array containing [1, nil, nil].
# On the first iteration, the local block variable `num` is assigned to the Integer
# 1. 1 is not greater than 1, so the if branch is not executed, and we move to the 
# else branch, which just evaluates and then implicitly returns `num` (1). 
# On the second and third iterations, `num` is assigned to 2 and 3, respectively, 
# which are greater than 1 - so the if branch is executed. This branch just contains 
# a single `puts` statement, which always returns `nil` (and that `nil` is then
# implicitly returned from the block).
# map collects the return values from the block into a new Array and returns that new
# Array at the end of iteration. Therefore, the return value from this code will be
# a new Array containing [1, nil, nil].