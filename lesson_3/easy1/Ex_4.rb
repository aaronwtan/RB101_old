# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]
# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # this removes the element at index 1 of numbers, i.e. 2; numbers = [1, 3, 4, 5]
numbers.delete(1) # this removes the literal 1 integer element from numbers; numbers = [2, 3, 4, 5]