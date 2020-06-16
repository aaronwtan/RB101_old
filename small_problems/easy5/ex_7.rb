# Modify the word_sizes method from the previous exercise
# to exclude non-letters when determining word size.
# For instance, the length of "it's" is 3, not 4.

def word_sizes(words)
  size_occurrences = Hash.new(0)
  words.split.each { |word| size_occurrences[word.count('A-Za-z')] += 1 }
  size_occurrences
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
