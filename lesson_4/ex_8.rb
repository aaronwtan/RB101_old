# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# As #each iterates through the array numbers, the current index will always increment by 1
# with every iteration, even if the array changes in size.
# This code would therefore output 1 and numbers would change to [2, 3, 4] in the first iteration at index 0,
# then in the second iteration it moves on to index 1 which is now 3, outputs 3 and changes numbers to [3, 4].
# At this point, iterating would stop because now the index moves to a value beyond the current size of numbers.
# The #each method returns [3, 4], which is the original array now mutated, and the output was
# printing 1 followed by a 3

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# by the same reasoning as above, #each would print 1, then 2 before stopping and returning
# the original mutated array [1, 2]
