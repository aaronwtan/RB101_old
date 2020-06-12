# Programmatically determine if 42 lies between 10 and 100.
Array(10..100).each { |num| puts "Found 42!" if num == 42 }

# alternatively
puts "42 is between 10 and 100." if (10..100).cover?(42)