# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# This will print 
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# This is because the reference value of each element of array1 is appended to array2
# so that each element of array2 refers to the exact same object that the corresponding
# element of array1 refers to. Curiously, the actual array objects that array1 and array2 as collections
# refer to are actually different as can be seen by checking their object ids,
# but they happen to be composed of identical object elements.
# Therefore, when #upcase! mutates certain values of array1 in place, the corresponding
# elements in array2 are also mutates because they in fact refer to the same objects.
# If a mutating method were to be called on the entire array1 that didn't affect any of its existing elements, 
# array2 would not be affected because the arrays themselves do refer to different objects!
