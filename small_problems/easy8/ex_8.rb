# Write a method that takes a string, and returns a new string
# in which every consonant character is doubled.
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(string)
  string.chars.map { |char| char =~ /[[a-z]&&[^aeiou]]/i ? char * 2 : char }.join
end

def double_consonants2(string)
  string.gsub(/([[a-z]&&[^aeiou]])/i, '\1\1')
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
