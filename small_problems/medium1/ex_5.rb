# Write a method that displays a 4-pointed diamond in an n x n grid, where n
# is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

def print_line(n, stars, style)
  spaces = n - stars
  half_spaces = spaces / 2
  if style == :solid || stars == 1
    puts "#{' ' * half_spaces}#{'*' * stars}#{' ' * half_spaces}"
  elsif style == :hollow
    puts "#{' ' * half_spaces}*#{' ' * (n - spaces - 2)}*#{' ' * half_spaces}"
  end
end

def diamond(n, style = :solid)
  stars = 1
  n.times do |line|
    print_line(n, stars, style)
    line < n / 2 ? stars += 2 : stars -= 2
  end
end

diamond(9)
diamond(9, :hollow)
