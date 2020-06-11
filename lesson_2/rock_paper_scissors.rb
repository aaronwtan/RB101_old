=begin
Game flow:
the user makes a choice
the computer makes a choice
the winner is displayed
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts ">> #{message}"
end

def valid_choice?(input)
  VALID_CHOICES.include?(input)
end

def winner?(player1, player2)
  player1_wins = case player1
                 when 'rock'     then player2 == 'scissors'
                 when 'paper'    then player2 == 'rock'
                 when 'scissors' then player2 == 'paper'
                 end
  player1_wins
end

def display_results(user_choice, computer_choice)
  if winner?(user_choice, computer_choice)
    prompt("You win!")
  elsif winner?(computer_choice, user_choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to Rock Paper Scissors, loser. You're going down.")

loop do
  user_choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    user_choice = gets.chomp.downcase
    break if valid_choice?(user_choice)
    prompt("Invalid choice.")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{user_choice}; Computer chose #{computer_choice}.")

  display_results(user_choice, computer_choice)

  prompt("Do you want to play again?")
  play_again = gets.chomp.downcase
  break unless ['yes', 'y'].include?(play_again)
end

prompt("Thank you for playing. Good bye!")
