# AOSRM Part 2
# 6) Given an Array of Hashes:
#    Select the elements for which all keys match the first character of 
#    the value.
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
# Line 1: #select Method Invocation. Object: [{a:ant, b:elephant}, {c:cat}]
#   Return: A new array containing the hashes where all hash keys == the first 
#     letter of the corresponding value. 
# Lines 1-5: Outer block execution for the #select method. Each element of the
#   calling array (the nested hashes) is assigned to the local block variable `hash`
#   The block will return either true or false, from `hash.all?`. This is a 
#     meaningful return value, as #select uses the truthiness of the block's 
#     return value to decide which elements to select.
# Line 2: #all? method invocation. Object: The current sub-hash assigned to `hash`.
#   #all? returns either true or false, depending on whether the given block 
#     returns a truthy value for all elements. Meaningful, as #all?'s return value
#     will also be the outer block's implicit return value.
# Line 2-4: Inner block execution. The local block variable `key` is assigned
#   to each key-value pair's key, and `value` is assigned to the value.
#   Return value will be true or false depending on the comparison on Line 3. Return
#   is meaningful, as it will determine whether #all? returns true or false.
# Line 3: Comparison. The first character of the current string object `value`
#   references is compared for equality against the current key (converted to 
#   a string). 
#   Return value is true or false. Return is meaningful, as it determines the 
#   implicit return value of the inner block.

# What would happen if we used #any? instead of #all?
# The return value from #select would become [{a: ant, b: elephant}, {c: cat}]
#   Each sub-hash is checked for whether ANY of their key-value pairs match the 
#   specified criteria (ie. first char of value == key).
#   Both sub-hashes will meet this criteria and therefore return true from 
#   #any?, thus being selected by #select.


# 7) 
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
# Goal: To sort the outer array. Subarrays are ordered according to the 
#   NUMERIC value of their string elements.
# Input: Nested array of subarrays. Each subarray contains 3 strings representing
#   3 integers.
# Output: A new array containing the same elements as `arr`, but sorted.
#   Sorting criteria: Each subarray is compared element-by-element. Element
#   comparison should be numerical (not string). Ascending numerical order

# Example:
# arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
# <sort arr>
# => [['1', '8', '9'], ['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15']]

# Data Structures:
#   The input array
#   The output array; a new array

# Algorithm:
# Given an input array of subarrays, arr:
#   Iterate through arr, two subarrays at a time. For each a/b subarray:
#   Compare the two subarrays using the INTEGER value of each element.
#     eg. ['1', '8', '11'] <=> ['1', '8', '9'] should return 1: 
#         1 and 8 are equal, and 11 > 9. 
#   ie. Sort the outer array BY the integer values of each subarray.
#   Transform each subarray into an array of integers (instead of strings)
#   Sort outer array using the subarrays of integers.

sorted = arr.sort_by do |subarr|
  subarr.map { |str| str.to_i }
end
# Line 1: #sort_by method invocation on `arr` array. Returns a new collection
#   (same type as caller) that is the result of sorting the calling array's 
#   elements by the given block's return values. Return is meaningful, as it is 
#   used in the sorted variable assignment.
# Line 1-3: Outer block execution for #sort_by. Each subarray of strings in `arr`
#   is assigned to the local block variable subarr. The block will return an 
#   array of Integers (the returned array from mapping over the current subarray)
#   Return is significant, as #sort_by uses the block's return value to sort the 
#   elements of the calling array.
# Line 2: #map method execution, called on the current subarray of strings. 
#   Return value will be an array of integer objects


# 8) 
# Nested Selection: Select only the elements that are shorter than 6 (string) or
# greater than 13 (integer).
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

# Line 1: #map invocation on outer array:
#   [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]
#   #map returns a new array with each element transformed, based on the return
#   value of the given block.
# Line 1-9: Outer block execution for #map.
#   Return value will be a new array (returned from #select), containing only a 
#   subset of the elements originally within each subarray. Return is meaningful,
#   as it will be added to the array that #map returns.
# Line 2: #select invocation on each subarray. 
#   #select returns a new collection (STAC) containing all elements from the 
#   calling collection for which the given block returns truthy.
#   Return is meaningful, as it determines the implicit return value of 
#   the outer block.
# Line 2-8: Inner block execution for #select. Each element within the current
#   subarray will be assigned to the local block variable `item`.
#   Block return value will be a boolean, based on the comparisons item > 13 or
#   item.size < 6. Return is meaningful, as it determines whether the current 
#   element is selected and returned by #select.
# Line 3-7: if/else conditional. If the current element referenced by `item` is 
#   an integer, execute Line 4. Otherwise, execute Line 6.
#   Line 4: Comparison. Returns true if `item` is greater than 13, false otherwise.
#     Return is meaningful as it determines the implicit return value of the inner
#     block.
#   Line 6: Comparison. Return true if `item`'s size (length) is less than 6.
#     Return is meaningful as it determines the inner block's implicit return value.


# 9)
[ [[1], [2], [3], [4]] , [['a'], ['b'], ['c']] ].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [ [[1], [2], [3], [4]] , [["a"], ["b"], ["c"]] ]
# Line 1: #map invocation on the outermost array:
#   [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
#   Return value of #map is a new array containing the return values of the 
#     block for each element. Return is insignificant.
# Line 1-7: Outer block execution for #map. Each nested subarray within the 
#   outermost array will be assigned to the local block variable `element1`.
#   Block return value will be the same subarray that `element1` is currently 
#     referencing; the last expression within the outer block is #each, which
#     always returns the calling collection (`element1`). 
#   Return value is meaningful, as the #map method will collect it into the 
#     array it returns at the end.

# Line 2: #each invocation on the current subarray. 
#   Return value will always be the calling collection (current subarray). Return 
#     is meaningful, as it determines the return value of the outermost #map block.
# Line 2-6: Middle block execution for #each. 
#   Each nested subarray within the current subarray will be assigned to the
#   block variable `element2`.
#   eg. [[1], [2], [3], [4]]; element2 = [1] / [2] / [3] / [4]
#   Block return value will be a 2d array from #partition:
#     eg. element2 = [1]; block returns [[1], []]
#   Block return is not meaningful, as #each does not care about the block return.

# Line 3: #partition invocation, on the current sub-subarray.
#   Return value will be a 2d array containing an array of elements for which 
#     the block returned truthy and falsy, respectively.
#   Return value is meaningful as it determines the middle block's return value
#     (though the middle block return is insignificant.)
# Line 3-5: innermost block execution for #partition. Each element within the 
#   current sub-subarray (eg. 1, 2, 3, 4, 'a', 'b', 'c') is assigned to `element3`.
#   Return value of the block will be a boolean (true if element3 is larger 
#   than 0, false otherwise.)
#   Return value is meaningful, as partition uses the block's return value to 
#     divide up the elements of the calling array.
# Line 4: Comparison. Returns true if element3's size is greater than 0; false 
#   otherwise. Return value is significant as it determines the innermost block's
#   implicit return value.


# 10) Increment every number by 1 without changing the data structure
# Changing = ?
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
# => [[[2, 3], [4, 5]], [6, 7]]

# Line 1: #map method call on outer array.
#   [ [[1, 2], [3, 4]] , [5, 6] ]
#   Return value will be an array of the block return values from each iteration
#   Return is not meaningful.
# Line 1: Outer block execution. Each subarray will be passed to `arr`:
#   [[1, 2], [3, 4]] and [5, 6]. Return value will be a new array, the return 
#     value of mapping over the current subarray `arr`

# Line 2: inner #map method call on the current subarray referenced by `arr`.
#   Return value will be a new array containing the return values of the block
#   for each iteration. 
#   Return value is meaningful, as it determines the return value of the outer 
#   block.
# Line 2: inner block execution for inner #map. Each element of the current sub
#   array will be passed to `el`: [1, 2], [3, 4] ; 5, 6
#   Return value will either be an incremented Integer (5->6, 6->7)
#     OR a new array (the return of `el.map`)
#   Return value is meaningful, as it will be used in inner #map's return value.

# Line 3: Conditional. 
#   If the current value referenced by `el` is an Integer,
#     implicitly return `el+1` (Integer + 1)
#     Return is meaningful, as it determines the inner block's return value

#   If the current value of `el` is not an Integer, it is an Array:
#   Line 6: inner-inner #map call on the current sub-subarray referenced by `el`
#     ie. [1, 2] or [3, 4].
#     Return value will be a new array containing return values from the innermost
#       block execution.
#     Return is meaningful, as it determines the inner block's return value. 
#   Line 6: inner-inner block execution for the innermost #map call. Each element
#     of the current sub-subarray (1, 2; 3, 4) will be passed to `n`.
#     Return value will be `n+1` (Integer + 1). Return is meaningful, as it 
#       will be used in the innermost #map's returned array.