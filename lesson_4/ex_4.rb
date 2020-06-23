# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# using basic looping
ages_keys = ages.keys
min_age = ages[ages_keys[0]]
counter = 1

loop do
  break if counter == ages.size

  current_key = ages_keys[counter]
  current_age = ages[current_key]
  min_age = current_age if current_age < min_age
  counter += 1
end

puts "#{ages.key(min_age).to_s} is the youngest at #{min_age.to_s} years old."
