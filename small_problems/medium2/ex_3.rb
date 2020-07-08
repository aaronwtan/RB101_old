# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(string)
  total_chars = string.size.to_f
  lowercase_percent = string.count('a-z') / total_chars * 100
  uppercase_percent = string.count('A-Z') / total_chars * 100
  neither_percent = string.count('^A-Za-z') / total_chars * 100

  { lowercase: lowercase_percent.round(2),
    uppercase: uppercase_percent.round(2),
    neither: neither_percent.round(2) }
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

puts letter_percentages('abcdefGHI')
