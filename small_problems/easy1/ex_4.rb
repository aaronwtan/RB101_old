# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# The words in the array are case-sensitive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number of occurrences.

def count_occurrences(array)
  output = {}

  array.each do |element|
    if output.key?(element)
      output[element] += 1
    else
      output[element] = 1
    end
  end

  output.each { |element, occurrence| puts "#{element} => #{occurrence}" }
end

count_occurrences(vehicles)

# Further Exploration
# Try to solve the problem when words are case insensitive, e.g. "suv" == "SUV".

vehicles2 = [
  'car', 'Car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'Motorcycle', 'CAR', 'Truck', 'suv'
]

def count_occurrences2(array)
  output = {}

  array.each do |element|
    if output.key?(element.downcase)
      output[element.downcase] += 1
    else
      output[element.downcase] = 1
    end
  end

  output.each { |element, occurrence| puts "#{element} => #{occurrence}" }
end

count_occurrences2(vehicles2)

# one-liner version
def count_occurrences3(array)
  array.tally.each { |k, v| puts "#{k} => #{v}"}
end

count_occurrences3(vehicles)
