# Write a method that takes an Array, and returns a new Array
# with the elements of the original list in reverse order.
# Do not modify the original list.

# You may not use Array#reverse or Array#reverse!,
# nor may you use the method you wrote in the previous exercise.

def reverse(list)
  list_reversed = []
  (list.size - 1).downto(0) { |i| list_reversed << list[i] }
  list_reversed
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

# Further Exploration
def reverse_using_inject(list)
  list.inject([], &:unshift)
end

def reverse_using_each_with_object(list)
  list.each_with_object([]) { |elem, rlist| rlist.unshift(elem) }
end

puts reverse_using_inject([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse_using_inject(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse_using_inject(['abc']) == ['abc']              # => true
puts reverse_using_inject([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse_using_inject(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

puts reverse_using_each_with_object([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse_using_each_with_object(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse_using_each_with_object(['abc']) == ['abc']              # => true
puts reverse_using_each_with_object([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse_using_each_with_object(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
