# Build a program that displays when the user will retire
# and how many years she has to work till retirement.

current_year = Time.now.year

puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

years_until_retirement = retire_age - current_age
retirement_year = current_year + years_until_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_until_retirement} years of work to go!"
