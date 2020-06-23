# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages_sum = 0
ages.each { |_, age| ages_sum += age }
p ages_sum

# how I would actually do it
p ages.values.inject(:+)

# using basic looping
ages_keys = ages.keys
total_ages = 0
counter = 0
loop do
  break if counter == ages.size

  current_key = ages_keys[counter]
  total_ages += ages[current_key]
  counter += 1
end

p total_ages
