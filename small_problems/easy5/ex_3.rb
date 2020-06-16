# As seen in the previous exercise, the time of day can be
# represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format,
# and return the number of minutes before and after midnight,
# respectively. Both methods should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

MINUTES_PER_DAY = 1440

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  (hours * 60 + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  minutes_after_midnight = after_midnight(time)
  (MINUTES_PER_DAY - minutes_after_midnight) % MINUTES_PER_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# Further Exploration
require 'time'

def after_midnight2(time)
  t = Time.parse(time)
  (t.hour * 60 + t.min) % MINUTES_PER_DAY
end

def before_midnight2(time)
  (MINUTES_PER_DAY - after_midnight2(time)) % MINUTES_PER_DAY
end

puts after_midnight2('00:00') == 0
puts before_midnight2('00:00') == 0
puts after_midnight2('12:34') == 754
puts before_midnight2('12:34') == 686
puts after_midnight2('24:00') == 0
puts before_midnight2('24:00') == 0
