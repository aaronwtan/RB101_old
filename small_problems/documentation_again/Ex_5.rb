# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7) # throws IndexError exception
puts a.fetch(7, 'beats me') # prints default value 'beats me'
puts a.fetch(7) { |index| index**2 } # executes block to print 49