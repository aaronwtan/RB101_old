# Alan wrote the following method, which was intended to show all
# of the factors of the input number:

def factors(number)
  factors = []
  return "#{number} is invalid. Please choose a positive number." if number <= 0
  number.downto(1) do |divisor|
    factors << number / divisor if number % divisor == 0
  end
  factors
end

puts factors(-5)
puts factors(0)
1.upto(20) { |x| puts "The factors of #{x} are #{factors(x).join(", ")}." }

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of
# raising an exception or going into an infinite loop.

# Bonus 1
# What is the purpose of the number % divisor == 0 ?

# This checks if divisor divides evenly into number with no remainder
# If it does, then divisor is a factor of number and this statement returns true

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method
# (the factors before the method's end)?

# This is to ensure the value of factors is returned from the factors method
# since Ruby implicitly returns the last line evaluated in a method
# in the absence of an explicit return
