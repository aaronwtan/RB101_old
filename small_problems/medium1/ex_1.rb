# Write a method that rotates an array by moving the first element
# to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(array)
  rotated_array = []
  (1...array.size).each { |index| rotated_array << array[index] }
  rotated_array << array.first
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# Further Exploration
def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string("Hello world!") == "ello world!H"
p rotate_string("") == ""
p rotate_string("a") == "a"

def rotate_integer(integer)
  rotated_integer = rotate_string(integer.abs.to_s).to_i
  integer.negative? ? -rotated_integer : rotated_integer
end

p rotate_integer(12345) == 23451
p rotate_integer(0) == 0
p rotate_integer(-123) == -231
