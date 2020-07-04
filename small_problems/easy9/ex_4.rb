# Write a method that takes an integer argument,
# and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(num)
  if num.positive?
    (1..num).to_a
  elsif num.negative?
    (1..-num).to_a.map(&:-@)
  else
    [0]
  end
end

def sequence2(num)
  num.positive? ? (1..num).to_a : (num..1).to_a.reverse
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]

p sequence2(1)
p sequence2(-1)
p sequence2(-10)
p sequence2(0)
