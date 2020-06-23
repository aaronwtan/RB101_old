# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

frequencies = statement.chars.each_with_object({}) do |char, hash|
  hash[char] = statement.count(char) unless char == ' '
end

p frequencies

# alternatively
frequencies = statement.chars.each_with_object(Hash.new(0)) do |char, hash|
  hash[char] += 1 unless char == ' '
end

p frequencies.sort.to_h
