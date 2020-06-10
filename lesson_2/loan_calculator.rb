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

def valid_number?(num)
  num =~ /\d/ && num =~ /^\d*\.?\d*$/
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
  loop do
    p = gets.chomp # loan amount
    break if valid_number?(p)
    prompt("invalid_number")
  end
  p = p.to_f

  prompt("APR")
  loop do
    apr = gets.chomp
    break if valid_number?(apr)
    prompt("invalid_number")
  end
  j_per = apr.to_f / 12 # APR converted to monthly percent rate
  j = j_per / 100 # monthly rate converted from percentage

  loop do
    prompt("loan_years")
    loop do
      n_years = gets.chomp # years of loan duration
      break if valid_number?(n_years)
      prompt("invalid_number")
    end

    prompt("loan_months")
    loop do
      n_months = gets.chomp # months of loan duration
      break if valid_number?(n_months)
      prompt("invalid_number")
    end

    n = n_years.to_f * 12 + n_months.to_f # total loan duration in months

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
