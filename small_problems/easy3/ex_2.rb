# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those
# two numbers: addition, subtraction, product, quotient, remainder,
# and power. Do not worry about validating the input.

def prompt(message)
  puts ">> #{message}"
end

operators = %i(+ - * / % **)

prompt("Enter the first number:")
numbers = [gets.to_i]

loop do
  prompt("Enter the second number:")
  numbers[1] = gets.to_i
  break unless numbers[1].zero?
  prompt("Second number cannot be 0.")
end

operators.each { |op| prompt("#{numbers[0]} #{op.to_s} #{numbers[1]} " \
                             "= #{numbers.inject(op)}") }
