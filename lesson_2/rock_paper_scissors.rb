=begin
Game flow:
the user makes a choice
the computer makes a choice
the player1_wins is displayed
=end

VALID_INPUTS = ['rock', 'r',
                'paper', 'p',
                'scissors', 'sc',
                'lizard', 'l',
                'spock', 'sp', 's']
ABBREVIATIONS = ['r', 'p', 'sc', 'l', 'sp']
VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WIN_RULES = { 'rock'     => ['scissors', 'lizard'],
              'r'        => ['scissors', 'lizard'],
              'paper'    => ['rock', 'spock'],
              'p'        => ['rock', 'spock'],
              'scissors' => ['paper', 'lizard'],
              'sc'       => ['paper', 'lizard'],
              'lizard'   => ['paper', 'spock'],
              'l'        => ['paper', 'spock'],
              'spock'    => ['rock', 'scissors'],
              'sp'       => ['rock', 'scissors'] }

def prompt(message)
  puts ">> #{message}"
end

# format a header input to add border matching length of header
def format_header(header)
  border = ''
  header.length.times { border << "-" }
  prompt(border.to_s)
  prompt(header)
  prompt(border.to_s)
end

# validate user input
def valid_choice?(input)
  VALID_INPUTS.include?(input)
end

# clarify whether user chooses 'scissors' or 'spock' if 's' is inputted
def clarify_choice
  loop do
    prompt("Scissors or Spock?")
    clarification = gets.chomp.downcase

    if ['scissors', 'sc'].include?(clarification)
      return 'scissors'
    elsif ['spock', 'sp'].include?(clarification)
      return 'spock'
    else
      prompt("Invalid choice.")
    end
  end
end

def expand_abbreviation(abbreviation)
  expansion = case abbreviation
              when 'r'  then 'rock'
              when 'p'  then 'paper'
              when 'sc' then 'scissors'
              when 'l'  then 'lizard'
              when 'sp' then 'spock'
              end
  expansion
end

def player1_wins?(player1, player2)
  WIN_RULES[player1].include?(player2)
end

def display_results(player, computer)
  if player1_wins?(player, computer)
    prompt("You win!")
  elsif player1_wins?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# return new score of player 1 based on player choices
def new_score(player1, player2, score)
  score += 1 if player1_wins?(player1, player2)
  score
end

def display_score(player, computer)
  format_header("CURRENT SCORE")
  prompt("Player: #{player}")
  prompt("Computer: #{computer}")
end

prompt("Welcome to Rock Paper Scissors Lizard Spock, loser. You're going down.")
puts "\n"

loop do
  choice = ''
  player_score = 0
  computer_score = 0
  round = 1
  player_grand_winner = false
  computer_grand_winner = false

  loop do
    format_header("ROUND #{round}")

    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      choice = gets.chomp.downcase
      break if valid_choice?(choice)
      prompt("Invalid choice.")
    end

    user_choice = if ABBREVIATIONS.include?(choice)
                    expand_abbreviation(choice)
                  elsif choice == 's'
                    clarify_choice
                  else
                    choice
                  end
    # expand user choice if user inputs abbreviation
    # clarify choice if 's' is inputted

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{user_choice}; Computer chose #{computer_choice}.")

    player_score = new_score(user_choice, computer_choice, player_score)
    computer_score = new_score(computer_choice, user_choice, computer_score)

    prompt("\n")
    display_results(user_choice, computer_choice)
    display_score(player_score, computer_score)
    puts "\n"

    round += 1
    
    if player_score == 5
      break player_grand_winner = true
    elsif computer_score == 5
      break computer_grand_winner = true
    end
  end

  if player_grand_winner
    prompt("Congratulations! You are the Grand Winner of " \
           "Rock Paper Scissors Lizard Spock!")
  elsif computer_grand_winner
    prompt("Too bad! You are the Grand Loser of " \
           "Rock Paper Scissors Lizard Spock!")
  end

  prompt("Do you want to play again?")
  play_again = gets.chomp.downcase
  break unless ['yes', 'y'].include?(play_again)
end

prompt("Thank you for playing. Good bye!")
