# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.

def staggered_case(string)
  staggered_string = ''
  need_cap = true
  string.chars.each do |char|
    if ('A'..'Z').include?(char) || ('a'..'z').include?(char)
      staggered_string << if need_cap
                            char.upcase
                          else
                            char.downcase
                          end
      need_cap = !need_cap
    else
      staggered_string << char
    end
  end
  staggered_string
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Further Exploration
def staggered_case2(string, first_cap = true, count_nonalpha = true)
  need_cap = !first_cap
  staggered_chars = string.chars.map do |char|
    need_cap = !need_cap if count_nonalpha || char =~ /[A-Z]/i
    need_cap ? char.upcase : char.downcase
  end
  staggered_chars.join
end

puts staggered_case2('I Love Launch School!', true, true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case2('I Love Launch School!', false, true) == 'i lOvE LaUnCh sChOoL!'
puts staggered_case2('I Love Launch School!', true, false) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case2('I Love Launch School!', false, false) == 'i LoVe LaUnCh ScHoOl!'

