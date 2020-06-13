# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

def prompt(message)
  puts ">> #{message}"
end

max = 0
choice = ''

loop do
  prompt("Please enter an integer greater than 0:")
  max = gets.to_i
  break if max.positive?
  prompt("Invalid input.")
end

loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  choice = gets.chomp.downcase
  break if ['s', 'p'].include?(choice)
  prompt("Invalid input.")
end

if choice == 's'
  result = 0
  1.upto(max) { |num| result += num }
  prompt("The sum of the integers between 1 and #{max} is #{result}.")
elsif choice == 'p'
  result = 1
  1.upto(max) { |num| result *= num }
  prompt("The product of the integers between 1 and #{max} is #{result}.")
end

# using #inject
loop do
  prompt("Please enter an integer greater than 0:")
  max = gets.to_i
  break if max.positive?
  prompt("Invalid input")
end

loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  choice = gets.chomp.downcase
  break if ['s', 'p'].include?(choice)
  prompt("Invalid input.")
end

if choice == 's'
  result = (1..max).inject(:+)
  prompt("The sum of the integers between 1 and #{max} is #{result}.")
elsif choice == 'p'
  result = (1..max).inject(:*)
  prompt("The product of the integers between 1 and #{max} is #{result}.")
end
