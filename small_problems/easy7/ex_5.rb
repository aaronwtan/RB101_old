# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters
# are lowercase. Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.

def staggered_case(string)
  staggered_string = ''
  string.chars.each_with_index do |char, i|
    staggered_string << char.upcase if i.even?
    staggered_string << char.downcase if i.odd?
  end
  staggered_string
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

def staggered_case2(string, first_cap = "upper")
  staggered_string = ''
  case first_cap
  when "upper" then need_cap = true
  when "lower" then need_cap = false
  else         return "Invalid case request. Please enter 'upper' or 'lower'."
  end
  string.chars.each_with_index do |char, i|
    if need_cap
      staggered_string << char.upcase
    else
      staggered_string << char.downcase
    end
    need_cap = !need_cap
  end
  staggered_string
end

puts staggered_case2('I Love Launch School!', 'lower')
puts staggered_case2('ALL_CAPS', 'lower')
puts staggered_case2('ignore 77 the 444 numbers', 'lower')
