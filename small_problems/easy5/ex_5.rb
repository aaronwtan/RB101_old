# Given a string that consists of some words (all lowercased)
# and an assortment of non-alphabetic characters, write a method
# that returns that string with all of the non-alphabetic characters
# replaced by spaces. If one or more non-alphabetic characters occur
# in a row, you should only have one space in the result
# (the result should never have consecutive spaces).

def cleanup(words)
  words.gsub(/[^a-z]+/i, ' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

# without #gsub
def cleanup2(words)
  clean_string = ''
  words.chars.each do |char|
    if ('a'..'z').cover?(char)
      clean_string << char
    else
      clean_string << ' '
    end
  end
  clean_string.squeeze(' ')
end

puts cleanup2("---what's my +*& line?") == ' what s my line '
