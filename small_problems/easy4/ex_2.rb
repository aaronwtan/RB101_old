# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01.
# So, the years 1901-2000 comprise the 20th century.

def century(year)
  century_num = if (year % 100).zero?
                  year / 100
                else
                  year / 100 + 1
                end

  century_num.to_s + suffix(century_num)
end

def suffix(century_num)
  if [11, 12, 13].include?(century_num % 100)
    'th'
  else
    case century_num % 10
    when 1 then 'st'
    when 2 then 'nd'
    when 3 then 'rd'
    else        'th'
    end
  end
end

def century_refactored(year)
  century = year / 100 + 1
  century = year / 100 if (year % 100).zero?

  suffixes = { 0 => 'th', 1 => 'st', 2 => 'nd', 3 => 'rd', 4 => 'th',
               5 => 'th', 6 => 'th', 7 => 'th', 8 => 'th', 9 => 'th' }
  ones_digit = century % 10
  
  if [11, 12, 13].include?(century % 100)
    "#{century}th"
  else
    "#{century}#{suffixes[ones_digit]}"
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

puts century_refactored(2000) == '20th'
puts century_refactored(2001) == '21st'
puts century_refactored(1965) == '20th'
puts century_refactored(256) == '3rd'
puts century_refactored(5) == '1st'
puts century_refactored(10103) == '102nd'
puts century_refactored(1052) == '11th'
puts century_refactored(1127) == '12th'
puts century_refactored(11201) == '113th'
