# Write a method that takes an Array of numbers,
# and returns an Array with the same number of elements,
# and each element has the running total from the original Array.

def running_total(numbers)
  total = 0
  numbers.map { |number| total += number }
end

# Further Exploration
def running_total2(numbers)
  total = 0
  numbers.each_with_object([]) do |num, totals| 
    totals << total + num 
    total += num
  end
end

def running_total3(numbers)
  numbers.map.with_index { |_, i| numbers[0..i].inject(:+) }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts running_total2([2, 5, 13]) == [2, 7, 20]
puts running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total2([3]) == [3]
puts running_total2([]) == []

puts running_total3([2, 5, 13]) == [2, 7, 20]
puts running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total3([3]) == [3]
puts running_total3([]) == []
