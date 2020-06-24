# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split.size >= 2 ? string.split[-2] : string
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# Further Exploration
# -----Edge cases-----
# Empty string => empty string
# 1 word => 1 word
# 2 words => 2 words
# Even words => middle 2 words

def middle_word(string)
  words = string.split
  middle = words.size / 2
  if words.size.zero?
    string
  elsif words.size.odd?
    words[middle]
  else
    words[middle - 1] + ' ' + words[middle]
  end
end

puts middle_word('The middle of this sentence is this.') == 'this'
puts middle_word('Bob') == 'Bob'
puts middle_word('last word') == 'last word'
puts middle_word('Launch School is great!') == 'School is'
puts middle_word('') == ''
