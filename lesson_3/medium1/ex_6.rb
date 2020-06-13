# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 
# prints 34; #mess_with_it does not use any destructive methods
# furthermore, integers are immutable so it would be impossible
# for a method to change answer from within itself
