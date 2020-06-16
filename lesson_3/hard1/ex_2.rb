# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# => { :a => "hi there" }
# informal_greeting points to the same string object value
# at key :a of greetings
# when informal_greeting is mutated, it is reflected
# in greetings[:a]
