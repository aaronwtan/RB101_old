# 1. a method that returns the sum of two integers

def summer(num1, num2)
  num1 + num2
end

# 2. a method that takes an array of strings, 
# and returns a string that is all those strings concatenated together

def string_smasher(strings)
  result_string = ""
  strings.each { |string|  result_string += string }
  result_string
end

# 3. a method that takes an array of integers, 
# and returns a new array with every other element

def every_other(numbers)
  arr = []
  
  numbers.each_with_index do |number, ind|
    if ind % 2 == 1
      arr.push(number)
    end
  end

  arr
end


# testing
puts summer(1, 2)
puts summer(-1, 2)
puts summer(-1, -2)
puts summer(0, 0)

p string_smasher(["hi", "my", "name", "is", "bob"])

p every_other(Array(1..10))