# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
# on whether the triangle is equilateral, isosceles, scalene, or invalid.

# valide triangle:
# - sum of lengths of two shortest sides > length of longest side
# - all side lengths > 0

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  sum_of_shortest_sides = sides[0] + sides[1]
  longest_side = sides[2]
  return :invalid unless sum_of_shortest_sides > longest_side && sides.all?(&:positive?)

  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  else        :scalene
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
