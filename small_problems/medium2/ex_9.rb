# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

def bubble_sort!(array)
  n = array.size - 1
  loop do
    swapped = false
    (0...n).each do |first|
      if array[first] > array[first + 1]
        array[first], array[first + 1] = [array[first + 1], array[first]]
        swapped = true
      end
    end
    break unless swapped
  end
  array
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

def optimized_bubble_sort!(array)
  n = array.size
  loop do
    swapped = false
    1.upto(n - 1) do |index|
      if array[index - 1] > array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
        swapped = true
      end
    end
    break unless swapped
    n -= 1
  end
  array
end

array = [5, 3]
optimized_bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
optimized_bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
optimized_bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

p bubble_sort!(5000.downto(1).to_a)
p optimized_bubble_sort!(5000.downto(1).to_a)
