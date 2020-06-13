# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

# The statement is trying to add two different data types,
# a string and an integer. Integers cannot be implicited
# converted into strings this way

# solution 1
puts "the value of 40 + 2 is " + (40 + 2).to_s

# solution 2
puts "the value of 40 + 2 is #{40 + 2}"
