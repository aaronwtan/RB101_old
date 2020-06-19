# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition,
# and each subsequent number is the sum of the two previous numbers.
# This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series,
# but the results grow at an incredibly rapid rate. For example,
# the 100th Fibonacci number is 354,224,848,179,261,915,075 --
# that's enormous, especially considering that it takes 6 iterations
# before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first
# Fibonacci number that has the number of digits specified as an argument.
# (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(number)
  current_fib_num = 1
  previous_fib_num = 1
  index = 2

  loop do
    next_fib_num = current_fib_num + previous_fib_num
    previous_fib_num = current_fib_num
    current_fib_num = next_fib_num
    index += 1
    break if current_fib_num.to_s.size >= number
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847

# fibonacci sequence using a much faster 'fast doubling' algorithm
# def fibonacci(n)
#   return 1 if n <= 2

#   nums = []
#   while n > 0
#     nums << n
#     n /= 2
#   end
  
#   a = 0
#   b = 1
  
#   until nums.empty?
#     n = nums.pop
#     c = a * ((b * 2) - a)
#     d = a * a + b * b
#     if n.odd?
#       a = d
#       b = c + d
#     else
#       a = c
#       b = d
#     end
#   end
#   a
# end

# def faster_find_fibonacci_index_by_length(number) # not actually 'faster'
#   return 1 if number == 1

#   index = 0

#   loop do
#     index += 1

#     n = index
#     nums = []
#     while n > 0
#       nums << n
#       n /= 2
#     end
    
#     a = 0
#     b = 1
    
#     until nums.empty?
#       n = nums.pop
#       c = a * ((b * 2) - a)
#       d = a * a + b * b
#       if n.odd?
#         a = d
#         b = c + d
#       else
#         a = c
#         b = d
#       end
#     end

#     fib_num = a
#     break if index > 50000
#     break if fib_num.to_s.size == number
#   end
#   index
# end

# puts faster_find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# puts faster_find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# puts faster_find_fibonacci_index_by_length(10) == 45
# puts faster_find_fibonacci_index_by_length(100) == 476
# puts faster_find_fibonacci_index_by_length(1000) == 4782
# puts faster_find_fibonacci_index_by_length(10000) == 47847
