# You have a bank of switches before you, numbered from 1 to n. Each switch is
# connected to exactly one light that is initially off. You walk down the row
# of switches and toggle every one of them. You go back to the beginning, and
# on this second pass, you toggle switches 2, 4, 6, and so on. On the third
# pass, you go back again to the beginning and toggle switches 3, 6, 9,
# and so on. You repeat this process and keep going until you have been
# through n repetitions.

# Write a method that takes one argument, the total number of switches, and
# returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

# The result is that 2 lights are left on, lights 1 and 4.
# The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9.
# The return value is [1, 4, 9].

def initialize_lights(n)
  lights = {}
  1.upto(n) { |light| lights[light] = false }
  lights
end

def toggle_every_nth_light(lights, n)
  lights.each do |number, state|
    lights[number] = (number % n).zero? ? !state : state
  end
end

def on_lights(lights)
  lights.select { |_, on| on }.keys
end

def off_lights(lights)
  lights.reject { |_, on| on }.keys
end

def lights_string(lights_array)
  case lights_array.size
  when 1 then "light #{lights_array[0]} is"
  when 2 then "lights #{lights_array[0]} and #{lights_array[-1]} are"
  else        "lights #{lights_array[0...-1].join(', ')}, and #{lights_array[-1]} are"
  end
end

def print_state(lights, round = 0)
  if lights.values.all? { |on| on }
    puts "round #{round}: every light is turned on"
  elsif lights.values.all? { |on| !on }
    puts "round #{round}: every light is turned off"
  else
    off_str = lights_string(off_lights(lights))
    on_str = lights_string(on_lights(lights))
    puts "round #{round}: #{off_str} now off; #{on_str} on."
  end
end

def get_on_lights(n)
  lights = initialize_lights(n)
  print_state(lights) unless n > 10

  1.upto(n) do |round|
    lights = toggle_every_nth_light(lights, round)
    print_state(lights, round) unless n > 10
  end

  on_lights(lights)
end

p get_on_lights(5)
p get_on_lights(10)
p get_on_lights(100)
p get_on_lights(1000)
