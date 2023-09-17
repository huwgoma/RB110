# AOSRM: Action Object Side effect Return Meaningful?

# 1)
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# The Array#each method is called on the multi-level array [[1, 2], [3, 4]]. The 
# local block variable `arr` is assigned to each nested subarray ([1, 2] and
# [3, 4]). 
# Within the block: on Line 2, the first element of each subarray currently 
# referenced by `arr` is printed by `puts arr.first`. Because this is the last
# expression in the block, and `puts` always returns nil, the block returns `nil`
# to the #each method after every execution (but the return value of the block
# is not meaningful to #each.) 
# After all iterations have been completed, #each returns the calling collection
# - the array [[1, 2], [3, 4]].


# 2) 
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]

# The #map method is called on the multi-level array [[1, 2], [3, 4]]; on each 
# iteration, the local block variable `arr` is assigned to each nested subarray,
# [1, 2] and [3, 4].
# Within the block: on Line 2, the first element of each subarray currently 
# referenced by `arr` is printed by `puts arr.first`, giving us the output 1 and 3.
# The return value of puts (nil) is then implicitly returned from the block,
# back to #map. 
# The #map method collects the block's return value into a new Array (which will
# be returned at the end). Because the block returns nil on each iteration, the 
# returned array will therefore be [nil, nil].

# Line 1: #map called on [[1, 2], [3, 4]]. Returns an array containing all
#   return values from the block; return value is not meaningful (but is shown)
# Line 1-3: block executed by #map. Each element of the calling array is passed
#   to `arr` ([1, 2] and [3, 4]). Block returns nil (from puts); return value is 
#   meaningful as it is what #map places in the returned array.
# Line 2: #first called on `arr`. Returns the first element of the subarray that
#   arr currently references (eg. 1 and 3). Return value is used by `puts`.
# Line 2: #puts called with the return value of arr.first as its argument. Side 
#   effect will output a string representation of the argument ('1', '3'). Returns
#   nil, which is significant as it determines the return value of the block (which
#   in turn determines the elements in #map's returned array).


# 3) 
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
# => [1, 3]

# Line 1: #map method called on [[1, 2], [3, 4]] array. Returns an array of the 
#   return values from the block (not meaningful, but is displayed).
# Line 1-4: block is executed for each element in the calling array. `arr` is 
#   assigned to each element (subarrays [1, 2] and [3, 4]). The return value of 
#   the block is whatever `arr.first` returns (1 and 3); meaningful because the
#   #map method appends the block's return value to its return value array
# Line 2: #first is called on `arr`, returning the first element of whatever `arr`
#   currently references (1 and then 3). Meaningful because this return value will
#   be printed by the `puts` method.
# Line 2: #puts is called with the value of arr.first as its argument. Side effect
#   will print out a string representation of the integers 1 and 3. Return value is
#   nil, and is not meaningful.
# Line 3: #first is called on `arr` again; returns the first element of the subarray
#   that arr currently references (1 or 3). Return value is meaningful, as it will
#   be implicitly returned from the block (and then added to the array that 
#   #map returns).


# 4) 
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
#=> [[18, 7], [3, 12]]

# Line 1: my_arr local variable initialized and assigned to the return value of 
#   #each.
# Line 1: #each method is invoked on the array [[18, 7], [3, 12]]. Return value is
#   the calling collection, [[18, 7], [3, 12]]; meaningful because it is saved to
#   my_arr (presumably for further use later).
# Lines 1-7: Block execution. Each subarray [18, 7] and [3, 12] is assigned to the
#   local block variable `arr`. The block will return that same subarray (from 
#   arr.each); return value is not meaningful.
# Line 2: #each is invoked on the subarray referenced by `arr`. Return value will
#   be that same subarray; meaningful as it determines the block's return value.
# Line 2-6: Block execution. Each integer within the current subarray is assigned
#   to the local block variable `num` (18, 7; 3, 12). Return value will be nil, and
#   is not meaningful.
# Line 3: Condition. num > 5 returns either true or false; meaningful, as it
#   determines whether the if statement will be executed.
# Line 3-5: Conditional if statement. Returns the last evaluated expression within
#   the branch that is executed; meaningful, as it determines the return value of
#   the inner block.
# Line 4: #puts method is invoked with the current value of `num` passed as its
#   argument. Side Effect: Output a string representing the current integer value
#   of `num`. Returns nil; not meaningful.


# 5) 
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]
# Line 1: #map invocation, on [[1, 2], [3, 4]]. Return value will be an array 
#   of the return values from the outer block; not meaningful.
#   Outer #map => [[2, 4], [6, 8]]

# Line 1-5: Outer block execution. Each subarray [1, 2] and [3, 4] is passed to 
#   the local block variable `arr`. The block will return an array; the result of
#   transforming each subarray using the inner #map call; meaningful, as the 
#   return value of the outer block is collected into the array returned by the 
#   outer #map.
# Line 2: inner #map invocation, on [1, 2] and [3, 4]. Returns an array of 
#   transformed numbers (return value from the inner block). Meaningful, as the
#   inner #map's return value is also the outer block's return value.
#   Inner #map => [2, 4], [6, 8]

# Line 2-4: inner block execution. Each integer (1, 2, 3, 4) is passed to the 
#   `num` local block variable. Return value is the value of `num*2`; meaningful, as 
#   the inner block's return value is collected into the inner #map's return array.
# Line 3: * method invocation on the current value of `num`, with 2 as an argument.
#   returns a new integer, num * 2 (2, 4, 6, 8). meaningful, as this becomes the
#   inner block's implicit return value