# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

def stringy(integer)
  string = ''
  add_1 = true

  integer.times do
    if add_1
      string << '1'
      add_1 = false
    else
      string << '0'
      add_1 = true
    end
  end

  string
end

# Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# The tests above should print true.

# Further Exploration
# Modify stringy so it takes an additional optional argument that defaults to 1.
# If the method is called with this argument set to 0, the method should return 
# a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy2(integer, start_with_1 = 1)
  string = ''

  if start_with_1 == 1
    integer.times { |index| index.even? ? string << '1' : string << '0' }
  elsif start_with_1.zero?
    integer.times { |index| index.even? ? string << '0' : string << '1' }
  else
    # just for fun, I made it so if the optional argument is an integer other than 0 or 1,
    # the method returns a string alternating that integer and 0
    integer.times { |index| index.even? ? string << start_with_1.to_s : string << '0' }
  end

  string
end

puts stringy2(6)
puts stringy2(9, 0)
puts stringy2(4, 4)
puts stringy2(7)