# Write a method that takes one argument, a positive integer,
# and returns a list of the digits in the number.

def digit_list(integer)
  str_arr = integer.to_s.split('') # splits number into array of digits as strings
  str_arr.map(&:to_i) # iteratively convert each digit string into integer and return list of digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# alternatively using place values
def digit_list2(integer)
  digits = []
  loop do
    integer, remainder = integer.divmod(10)
    digits.unshift(remainder)
    break if integer.zero?
  end
  digits
end

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true
