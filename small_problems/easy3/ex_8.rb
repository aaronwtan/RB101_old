# Write a method that returns true if the string passed
# as an argument is a palindrome, false otherwise.
# A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.

def palindrome?(str)
  str == str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# Further Exploration (without using reverse method or if statements)
def palindrome2?(input)
  i = 0
  reverse_i = input.size - 1
  check_sames = []
  while i < input.size
    check_sames << (input[i] == input[reverse_i])
    i += 1
    reverse_i -= 1
  end
  !check_sames.include?(false)
end

puts palindrome2?('madam') == true
puts palindrome2?('Madam') == false
puts palindrome2?("madam i'm adam") == false
puts palindrome2?('356653') == true
puts palindrome2?([1, 2, 3, 4, 5]) == false
puts palindrome2?([1, 2, 3, 2, 1]) == true
puts palindrome2?([1]) == true
puts palindrome2?([1, '2', '2', 1]) == true
