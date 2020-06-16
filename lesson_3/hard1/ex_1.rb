# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

  if false
    greeting = “hello world”
  end
  
  greeting
# greeting will return nil because it is initialized within the if block
# even if the block is never executed to assign greeting a value
