# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).

def multiply(a, b)
  a * b
end

def square(num)
  multiply(num, num)
end

# Further Exploration
def nth_power(num, power)
  product = 1
  if power > 0 # for positive integer exponents
    power.times { product = multiply(product, num) }
  else # for negative integer exponents; also catches the 0 exponent case
    (-power).times { product = multiply(product, 1 / num.to_f) }
  end
  product
end

puts nth_power(2, 0) == 1
puts nth_power(2, 1) == 2
puts nth_power(2, 2) == 4
puts nth_power(2, -1) == 0.5
puts nth_power(2, -2) == 0.25
puts nth_power(-2, 0) == 1
puts nth_power(-2, 1) == -2
puts nth_power(-2, 2) == 4
puts nth_power(-2, -1) == -0.5
puts nth_power(-2, -2) == 0.25
