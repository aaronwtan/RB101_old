=begin
Mortgage/Car Loan Calculator

mortgage formula:
M = P * (J / (1 - (1 + J) ** (-N)))

inputs: loan amount
        Annual Percentage Rate (APR)
        loan duration

calculate: monthly interest rate
           loan duration in months
           monthly payment

outputs: monthly payment
=end

require "yaml"
MESSAGES = YAML.load_file("loan_calculator_messages.yml")

def prompt(key)
  if MESSAGES.has_key?(key)
    message = MESSAGES[key]
    puts ">> #{message}"
  else
    puts ">> #{key}"
  end
end

def number?(num)
  num =~ /\d/ && num =~ /^\d*\.?\d*$/
end

def ask_and_validate_number
  loop do
    input = gets.chomp
    if number?(input) then break input.to_f end
    prompt("invalid_number")
  end
end

prompt("welcome")
puts "------------------------------------------------------------------------"

loop do
  p = 0
  apr = 0
  n_years = 0
  n_months = 0
  n = 0

  prompt("loan_amount")
  p = ask_and_validate_number # loan amount

  prompt("APR")
  apr = ask_and_validate_number  # APR as percentage
  j_per = apr / 12 # APR converted to monthly percent rate
  j = j_per / 100 # monthly rate converted from percentage

  loop do
    prompt("loan_years")
    n_years = ask_and_validate_number # years of loan duration

    prompt("loan_months")
    n_months = ask_and_validate_number # months of loan duration

    n = n_years * 12 + n_months # total loan duration in months

    break unless n == 0.0
    prompt("invalid_term")
  end

  m = p * (j / (1 - (1 + j)**(-n))) # monthly payment calculation

  prompt(format("For a monthly interest rate of %.1f%%, " \
              "you must make %d monthly payments of $%.2f.", j_per, n, m))

  prompt("retry")
  response = ""

  loop do
    response = gets.chomp.downcase
    break if ["y", "n"].include?(response)
    prompt("invalid_response")
  end

  if response == "n"
    break prompt("goodbye")
  end
end
