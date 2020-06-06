# Command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

# Flow of app:
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

num1 = 0
num2 = 0

Kernel.puts("Welcome to Calculator!")

loop do 
  Kernel.puts("First number?")
  num1 = Kernel.gets().chomp()
  break if num1.to_i().to_s() == num1
  Kernel.puts("Invalid input. Please enter a number.")
end

loop do
  Kernel.puts("Second number?")
  num2 = Kernel.gets().chomp()
  break if num2.to_i().to_s() == num2
  Kernel.puts("Invalid input. Please enter a number.")
end

loop do
  Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
  operation = Kernel.gets().chomp().downcase()

  if operation == "add" || operation == "1"
    result = num1.to_i() + num2.to_i()
    break Kernel.puts("Result: #{result}")
  elsif operation == "subtract" || operation == "2"
    result = num1.to_i() - num2.to_i()
    break Kernel.puts("Result: #{result}")
  elsif operation == "multiply" || operation == "3"
    result = num1.to_i() * num2.to_i()
    break Kernel.puts("Result: #{result}")
  elsif operation == "divide" || operation == "4"
    if num2.to_i() == 0
      Kernel.puts("Cannot divide by 0. Please choose a different operation or restart with new numbers.")
      next
    end
    result = num1.to_f() / num2.to_f
    break Kernel.puts("Result: #{result}")
  else
    Kernel.puts("Invalid operation.")
  end
end