# Write a method that takes a floating point number that
# represents an angle between 0 and 360 degrees and returns
# a String that represents that angle in degrees, minutes and seconds.
# You should use a degree symbol (°) to represent degrees,
# a single quote (') to represent minutes, and a double quote (")
# to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0".freeze
MIN_PER_DEG = 60
SEC_PER_MIN = 60
SEC_PER_DEG = MIN_PER_DEG * SEC_PER_MIN

def dms(angle)
  total_seconds = angle * SEC_PER_DEG
  minutes, seconds = total_seconds.divmod(SEC_PER_MIN)
  degrees, minutes = minutes.divmod(MIN_PER_DEG)
  format("%d%s%.2d'%.2d\"", degrees, DEGREE, minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Further Exploration
MAX_ANGLE = 360

def dms_refactored(angle)
  total_seconds = angle % MAX_ANGLE * SEC_PER_DEG
  minutes, seconds = total_seconds.divmod(SEC_PER_MIN)
  degrees, minutes = minutes.divmod(MIN_PER_DEG)
  format(%(#{degrees}#{DEGREE}%.2d'%.2d"), minutes, seconds)
end

puts dms_refactored(400) == %(40°00'00")
puts dms_refactored(-40) == %(320°00'00")
puts dms_refactored(-420) == %(300°00'00")
