# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

def print_teddys_age
  puts "Teddy is #{rand(20..200)} years old!"
end

print_teddys_age

# Further Exploration
def print_age
  puts ">> What is your name?"
  name = gets.chomp

  if name.empty?
    puts ">> Teddy is #{rand(20..200)} years old!"
  else
    puts ">> #{name} is #{rand(20..200)} years old!"
  end
end

print_age