# Write a method that takes a string argument and returns
# a new string that contains the value of the original string
# with all consecutive duplicate characters collapsed into a single character.
# You may not use String#squeeze or String#squeeze!.

def crunch(string)
  crunched_string = ''
  string.each_char do |char|
    crunched_string << char unless char == crunched_string[-1]
  end
  crunched_string
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

# Further Exploration using regex
def regex_crunch(string)
  string.gsub(/(.)\1+/, '\1')
end

puts regex_crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts regex_crunch('4444abcabccba') == '4abcabcba'
puts regex_crunch('ggggggggggggggg') == 'g'
puts regex_crunch('a') == 'a'
puts regex_crunch('') == ''
