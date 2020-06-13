# Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# If you said that code printed

Alice
Bob

# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?
This will print out:

BOB
BOB

This is because both name and save_name are assigned and point to the same 'Bob' string object.
The #upcase! method called on name mutates its caller object which both name and save_name point to,
so both variables will reflect the output of #upcase!.
