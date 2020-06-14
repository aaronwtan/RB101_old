# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the
# 6th number appears amongst the first 5 numbers.

def prompt(message)
  puts ">> #{message}"
end

def ask_for_n_numbers(n) # works as expected up to n = 20
  numbers = []
  suffixes = { 1 => 'st', 2 => 'nd', 3 => 'rd' }
  suffixes.default = 'th'
  n.times do |i|
    if i == n - 1
      prompt("Enter the last number:")
    else
      prompt("Enter the #{i + 1}#{suffixes[i]} number:")
    end
    numbers << gets.to_i
  end
  numbers
end

six_numbers = ask_for_n_numbers(6)
first_numbers = six_numbers[0..-2]
sixth_number = six_numbers.last

if first_numbers.include?(sixth_number)
  prompt("The number #{sixth_number} appears in #{first_numbers}.")
else
  prompt("The number #{sixth_number} does not appear in #{first_numbers}.")
end
