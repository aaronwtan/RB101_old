# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# => array of substrings given string
def substrings(string)
  substrings_arr = []
  start_index = 0
  loop do
    break if start_index >= string.length

    end_index = start_index + 1
    loop do
      break if end_index >= string.length

      substrings_arr << string[start_index..end_index]
      end_index += 1
    end
    start_index += 1
  end
  substrings_arr
end

# => true or false if given string is a palindrome
def palindrome?(string)
  string.reverse == string
end

def palindrome_substrings(string)
  palindromes = []
  substrings_arr = substrings(string)
  substrings_arr.each { |substring| palindromes << substring if palindrome?(substring) }
  palindromes
end

puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []
