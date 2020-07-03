# Write a method that returns a list of all substrings of a string
# that are palindromic. That is, each substring must consist
# of the same sequence of characters forwards as it does backwards.
# The return value should be arranged in the same sequence
# as the substrings appear in the string. Duplicate palindromes
# should be included multiple times.

# You may (and should) use the substrings method you wrote
# in the previous exercise.

# For the purposes of this exercise, you should consider all characters
# and pay attention to case; that is, "AbcbA" is a palindrome,
# but neither "Abcba" nor "Abc-bA" are. In addition,
# assume that single characters are not palindromes.

def substrings_at_start(string)
  (1..string.length).map { |length| string[0, length] }
end

def substrings(string)
  (0...string.length).each_with_object([]) do |index, substrings|
    substrings.concat(substrings_at_start(string[index..-1]))
  end
end

def palindrome?(string)
  string == string.reverse && string.length > 1
end

def alphanum_palindrome?(string)
  alphanum_string = string.scan(/[a-z0-9]/i)
  alphanum_string == alphanum_string.reverse && alphanum_string.length > 1
end

def palindromes(string)
  substrings(string).select { |substring| palindrome?(substring) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
