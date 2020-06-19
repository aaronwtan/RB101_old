# Write a method that takes an Array as an argument,
# and returns two Arrays (as a pair of nested Arrays)
# that contain the first half and second half of the original Array,
# respectively. If the original array contains an odd number
# of elements, the middle_i element should be placed in the first half Array.

def halvsies(array)
  middle_i = (array.size / 2.0).ceil - 1
  [array[0..middle_i], array[middle_i + 1..-1]]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]
