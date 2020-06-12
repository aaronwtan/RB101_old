# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
# Use the ruby documentation to determine what this code will print.
# When a method defines default arguments and all the arguments are not supplied to the method,
# Ruby will fill in any missing arguments in-order.
# here, 4 is assigned to a, then 6 is assigned to d. 5 has not been assigned to a parameter yet, so it is assigned to b,
# which leaves c with the default value of 3
# this code will therefore print: [4, 5, 3, 6]