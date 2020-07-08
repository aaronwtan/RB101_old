# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value,
# storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value,
# storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

def add_to_register(command)
  command.to_i.to_s == command ? command.to_i : "ERROR: #{command} is not a valid token."
end

def execute_command(command, register, stack)
  case command
  when 'PUSH'  then stack.push(register)
  when 'PRINT' then puts register
  when 'ADD'   then register += stack.pop
  when 'SUB'   then register -= stack.pop
  when 'MULT'  then register *= stack.pop
  when 'DIV'   then register /= stack.pop
  when 'MOD'   then register %= stack.pop
  when 'POP'   then register = stack.pop
  else              register = add_to_register(command)
  end
  [register, stack]
end
# stack technically does not need to be returned by #execute_command
# since #pop mutates the object that stack points to
# I add stack as a return value to make it clearer that stack has been operated on
# and to avoid having both return values and side effects from #execute_command

def minilang(program)
  stack = []
  register = 0
  program.split.each do |command|
    register, stack = execute_command(command, register, stack)
    return "ERROR: Empty stack." if register.nil?
    return register unless register.is_a? Integer
    # register here doubles as a trigger/storage for any error messages
    # which only occurs if register is nil (meaning #pop was called on an empty stack)
    # or if register is anything other than an integer (meaning the command is invalid)
  end
  nil
end

p minilang('PRINT')
# 0

p minilang('5 PUSH 3 MULT PRINT')
# 15

p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

p minilang('5 PUSH POP PRINT')
# 5

p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

p minilang('-3 PUSH 5 SUB PRINT')
# 8

p minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Further Exploration
# Write a minilang program to evaluate and print the result of this expression:
# (3 + (4 * 5) - 7) / (5 % 3)
# = 8

p minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT')
