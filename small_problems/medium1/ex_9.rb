# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  fib1, fib2 = [1, 1]
  i = 3

  loop do
    break if i > n
    fib1, fib2 = [fib2, fib1 + fib2]
    i += 1
  end
  fib2
end

def fibonacci_fast_doubling(n)
  return 1 if n <= 2

  nums = []
  while n > 0
    nums << n
    n /= 2
  end
  
  a = 0
  b = 1
  
  until nums.empty?
    n = nums.pop
    c = a * (2 * b - a)
    d = a * a + b * b
    if n.odd?
      a = d
      b = c + d
    else
      a = c
      b = d
    end
  end
  a
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

puts fibonacci_fast_doubling(20) == 6765
puts fibonacci_fast_doubling(100) == 354224848179261915075
fibonacci_fast_doubling(3_100_001)
