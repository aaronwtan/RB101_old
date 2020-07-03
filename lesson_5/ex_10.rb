# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure
# to the original but where the value of each integer is incremented by 1.

arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr1.map do |hsh|
  new_hsh = {}
  hsh.each do |k, v|
    new_hsh[k] = v + 1
  end
  new_hsh
end

p arr1
p arr2

# using each_with_object

arr3 = arr1.map do |hsh|
  hsh.each_with_object({}) do |(k, v), new_hsh|
    new_hsh[k] = v + 1
  end
end

p arr3
