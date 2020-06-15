# In the previous exercise, you developed a method that
# converts non-negative numbers to strings. In this exercise,
# you're going to extend that method by adding the ability
# to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a
# string representation.

# You may not use any of the standard conversion methods
# available in Ruby, such as Integer#to_s, String(), Kernel#format,
# etc. You may, however, use integer_to_string from the previous exercise.

def integer_to_string(integer)
  digits = []
  loop do
    integer, digit = integer.divmod(10)
    digits.unshift(digit)
    break if integer.zero?
  end
  digits.join
end

def signed_integer_to_string(integer)
  sign = case integer <=> 0
         when -1 then '-'
         when 1  then '+'
         else         ''
         end
  sign + integer_to_string(integer.abs)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
