# The time of day can be represented as the number of minutes
# before or after midnight. If the number of minutes is positive,
# the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write a method that takes a time using this minute-based format and
# returns the time of day in 24 hour format (hh:mm).
# Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % (60 * 24)
  hours, minutes = delta_minutes.divmod(60)
  format("%.2d:%.2d", hours, minutes)
end

# puts time_of_day(0) == "00:00"
# puts time_of_day(-3) == "23:57"
# puts time_of_day(35) == "00:35"
# puts time_of_day(-1437) == "00:03"
# puts time_of_day(3000) == "02:00"
# puts time_of_day(800) == "13:20"
# puts time_of_day(-4231) == "01:29"

# Further Exploration
require 'date'

SUNDAY_MIDNIGHT = Time.new(2020, 6, 14)

def day_and_time(delta_minutes)
  day_and_time = SUNDAY_MIDNIGHT + delta_minutes * 60
  day_and_time.strftime("%A %H:%M")
end

puts day_and_time(0) == "Sunday 00:00"
puts day_and_time(-3) == "Saturday 23:57"
puts day_and_time(35) == "Sunday 00:35"
puts day_and_time(-1437) == "Saturday 00:03"
puts day_and_time(3000) == "Tuesday 02:00"
puts day_and_time(800) == "Sunday 13:20"
puts day_and_time(-4231) == "Thursday 01:29"

# alternatively
def time_and_day(delta_minutes)
  day = Date::DAYNAMES[delta_minutes / 1440]
  "#{day} #{time_of_day(delta_minutes)}"
end

puts time_and_day(0) == "Sunday 00:00"
puts time_and_day(-3) == "Saturday 23:57"
puts time_and_day(35) == "Sunday 00:35"
puts time_and_day(-1437) == "Saturday 00:03"
puts time_and_day(3000) == "Tuesday 02:00"
puts time_and_day(800) == "Sunday 13:20"
puts time_and_day(-4231) == "Thursday 01:29"
