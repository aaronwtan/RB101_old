# Build a program that asks a user for the length and width
# of a room in meters and then displays the area of the room
# in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 12**2
SQMETERS_TO_SQCENTIMETERS = 100**2

puts "Enter the length of the room in meters:"
length = gets.to_f

puts "Enter the width of the room in meters:"
width = gets.to_f

area_sqmeters = (length * width).round(2)
area_sqfeet = (area_sqmeters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{area_sqmeters} square meters " \
     "(#{area_sqfeet} square feet)."

# Further Exploration
# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square centimeters.

puts "Enter the length of the room in feet:"
length_ft = gets.to_f

puts "Enter the width of the room in feet:"
width_ft = gets.to_f

area_sqft = (length_ft * width_ft).round(2)
area_sqin = (area_sqft * SQFEET_TO_SQINCHES).round(2)
area_sqcm = (area_sqft / SQMETERS_TO_SQFEET *
             SQMETERS_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{area_sqft} square feet " \
     "(#{area_sqin} square inches or #{area_sqcm} square centimeters)."
