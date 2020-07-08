def fibonacci(nth)
  fib1, fib2 = [1, 1]
  3.upto(nth) { fib1, fib2 = [fib2, fib1 + fib2] }
  fib2
end

def fibonacci_last(nth)
  last_digits = [1, 1]
  3.upto(nth) do
    last_digits = [last_digits[-1], (last_digits[0] + last_digits[-1]) % 10]
  end
  last_digits[-1]
end

# puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# puts fibonacci_last(123456789) # -> 4

# Further Exploration
def fibonacci_last_refactored(nth)
  nth % 60 == 0 ? 0 : fibonacci_last(nth % 60)
end

puts fibonacci_last_refactored(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last_refactored(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last_refactored(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last_refactored(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last_refactored(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last_refactored(123456789) # -> 4
puts fibonacci_last_refactored(123_456_789_987_745) # -> 5
puts fibonacci_last_refactored(2_093_480_295_038_402_938_019_340_293_840_293_428_573_498_572_034) # -> 2
puts fibonacci_last_refactored(60) # -> 0
puts fibonacci_last_refactored(120) # -> 0
