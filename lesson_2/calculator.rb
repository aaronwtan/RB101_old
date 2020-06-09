# Command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

# Flow of app:
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

LANGUAGE = "en"
require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

def messages(message, lang="en")
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  if message.nil?
    Kernel.puts("=> #{key}")
  else
    Kernel.puts("=> #{message}")
  end
end

# original integer validation used

# def number?(num)
#   num.to_i().to_s() == num
# end

# refactored integer validation

# def number?(num)
#   num =~ /^-?\d+$/
# end

# refactored number validation to included floats

def number?(num)
  num =~ /^ *[+,-]?\d*\.?\d*([e,E]\d)? *$/ && num =~ /\d/
  # first half of statement: matches optional preceding +/- sign,
  # 0+ digits before decimal, optional decimal, 0+ digits after decimal
  # second half verifies there is at least one digits in the input
end

def operation_to_message(operation)
  message = case operation
            when "1" then "Adding"
            when "2" then "Subtracting"
            when "3" then "Multiplying"
            when "4" then "Dividing"
            end
  message
end

prompt("welcome")

name = ""

loop do
  name = Kernel.gets().chomp()
  break unless name.empty?()
  prompt("valid_name")
end

prompt("Hi #{name}!")

loop do
  num1 = 0
  num2 = 0

  loop do
    prompt("first_number_prompt")
    num1 = Kernel.gets().chomp()
    break if number?(num1)
    prompt("invalid_number_error")
  end

  loop do
    prompt("second_number_prompt")
    num2 = Kernel.gets().chomp()
    break if number?(num2)
    prompt("invalid_number_error")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)

  operation = ""

  loop do
    operation = Kernel.gets().chomp().downcase()
    break if %w(1 2 3 4).include?(operation)
    prompt("invalid_operation_error")
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
           when "1" then num1.to_f() + num2.to_f()
           when "2" then num1.to_f() - num2.to_f()
           when "3" then num1.to_f() * num2.to_f()
           when "4"
             if num2.to_f() == 0
               prompt("division_by_zero_error")
               next
             end
             num1.to_f() / num2.to_f
           end

  prompt("Result: #{result}")

  prompt("again")
  again = ""

  loop do
    again = Kernel.gets().chomp().downcase()
    break if again == "y" || again == "n"
    prompt("again_error")
  end

  if again == "n"
    prompt("quit")
    break
  end
end
