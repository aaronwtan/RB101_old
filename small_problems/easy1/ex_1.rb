# Write a method that takes two arguments, a string and a positive integer, 
# and prints the string as many times as the integer indicates.

def repeat(str, num)
  if num > 0
    num.times { puts str }
  else
    puts "Input a positive integer."
  end
end

repeat('Hello', 3)
repeat('Good bye', 0)
repeat('Good bye', -4)
repeat('It\'s a good day for pie', 10)