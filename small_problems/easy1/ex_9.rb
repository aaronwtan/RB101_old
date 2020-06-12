# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(int)
  int.to_s.split('').map(&:to_i).sum
end

# Examples:

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

def sum_no_loops(int)
  int.digits.sum
end

def sum_no_loops2(int)
  int.to_s.split('').sum(&:to_i)
end

# Examples:

puts sum_no_loops(23) == 5
puts sum_no_loops(496) == 19
puts sum_no_loops(123_456_789) == 45

puts sum_no_loops2(23) == 5
puts sum_no_loops2(496) == 19
puts sum_no_loops2(123_456_789) == 45