# 1. What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]; #select will return a new array with every element in the caller for which
# the passed block returns a truthy value. Since 'hi' is a truthy value and it is the last line
# of the block, the block will always return true, a new array with every element of the caller
# will be returned by #select

# 2. How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2; #count counts the number of elements for which the return value of the block returns true

# 3. What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]; #reject will return a new array with every element in the caller for which
# the passed block returns a falsey value. Calling #puts will always return nil, so since this is the
# last line of the block, the block will always return nil, a falsely value.
# Therefore, a new array with every element of the caller will be returned by #reject
# This is essentially the opposite of the #select method

# 4. What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

#  => { 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }; #each_with_object will return the 
# method argument passed, mutated based on the passed block. value is the current
# element of the collection being iterated

# 5. What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# #shift will return the first key-value pair of hash as an array: [:a, 'ant']; the original
# hash will be changed with the first pair removed

# 6. What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

# => 11; #pop will remove the last element from the caller and return the removed element,
# so the return value of #pop in this statement will be the string 'caterpillar'. #size
# is then called on this return value which will return the number of characters
# in the string: 11

# 7. What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# The block's return value is the return value of num.odd? for each iteration
# since this is the last statement in the block, so the block will return
# true if the iterated element is odd and false if it is even.
# #any? will return true if the passed block ever returns a truthy value on any iteration,
# so #any? in this case will return true and only output 1, since #any? will stop
# iterating as soon as a truthy value is returned from the block

# 8. How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# #take(n) will return the first n elements of an array. It does not mutate the caller array

# 9. What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# #map will always perform a transformation based on the return value of the passed block
# and return a new array with these return values.
# The return value of the block will be the return value of the if statement,
# which will be nil if the value.size > 3 is false
# The return value of #map will therefore be [nil, 'bear']

# 10. What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil]; #puts will always return nil, so the return value of the if
# statement and therefore the entire block will be nil if num > 1 evaluates to true
# and the value of num otherwise
