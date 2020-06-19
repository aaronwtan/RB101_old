# Write a method that takes an Array as an argument,
# and reverses its elements in place; that is, mutate
# the Array passed into this method. The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(list)
  list_reversed = []
  (list.size - 1).downto(0) { |i| list_reversed << list[i] }
  list.each_index { |i| list[i] = list_reversed[i] }
  # alternatively
  # list.each_index { |i| list.unshift(list.slice!(i)) }
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]

list = ['abc']
puts reverse!(list) == ["abc"]
puts list == ["abc"]

list = []
puts reverse!(list) == []
puts list == []
