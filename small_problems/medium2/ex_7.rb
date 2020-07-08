# Write a method that returns the number of Friday the 13ths
# in the year given by an argument. You may assume that the year is greater
# than 1752 (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.

def friday_13th(year)
  (1..12).count { |month| Time.new(year, month, 13).friday? }
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# Further Exploration
# Count the number of months that have five Fridays.

require 'date'

def five_fridays(year)
  (1..12).count do |month|
    current_month = Date.new(year, month)
    (current_month...current_month.next_month).count(&:friday?) == 5
  end
end

puts five_fridays(2020) == 4
puts five_fridays(2019) == 4
puts five_fridays(2016) == 5
puts five_fridays(2008) == 4
