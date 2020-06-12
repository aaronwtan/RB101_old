# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. 
# You may assume that the argument is a valid integer value.
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

def is_odd?(integer)
  integer % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Further Exploration
def is_odd_refactored?(integer)
  integer.remainder(2).abs == 1 # absolute value of #remainder method's return is compared to ensure non-negative comparison
end

puts "After revision"

puts is_odd_refactored?(2)    # => false
puts is_odd_refactored?(5)    # => true
puts is_odd_refactored?(-17)  # => true
puts is_odd_refactored?(-8)   # => false
puts is_odd_refactored?(0)    # => false
puts is_odd_refactored?(7)    # => true