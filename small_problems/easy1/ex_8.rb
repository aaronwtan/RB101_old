# Write a method that takes one argument, an array containing integers,
# and returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers.

def average(array)
  array.sum / array.size
end

# Examples:

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# The tests above should print true.

# Further Exploration
def average_floats(array)
  array.sum(0.0) / array.size
end

puts average_floats([1, 5, 87, 45, 8, 8])
puts average_floats([9, 47, 23, 95, 16, 52])