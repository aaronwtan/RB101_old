 # What would you expect the code below to print out?
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# this code will print out the original numbers array [1, 2, 2, 3] 
# because #uniq does not mutate its caller