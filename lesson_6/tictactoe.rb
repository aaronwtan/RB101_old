# Ruby simulation of the game of Tic-Tac-Toe played against the computer
# require 'pry'

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]]            # diagonals

def prompt(message)
  puts ">> #{message}"
end

def joinor(elements, delimiter = ', ', word = 'or')
  case elements.size
  when 0 then ''
  when 1 then elements.first
  when 2 then elements.join(" #{word} ")
  else
    elements[-1] = "#{word} #{elements.last}"
    elements.join(delimiter)
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  puts "\nYou are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.\n\n"
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |square| new_board[square] = EMPTY_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |space| board[space] == EMPTY_MARKER }
end

def display_score(score, round)
  system 'clear'
  header = "Round #{round}"
  puts header
  puts '-' * header.length
  puts "Player: #{score[0]}"
  puts "Computer: #{score[1]}"
end

def update_score(score, winner)
  if winner == 'Player'
    score[0] += 1
  elsif winner == 'Computer'
    score[1] += 1
  end
end

def player_moves!(board)
  move = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(board))}")
    move = gets.to_i

    break if board.key?(move) && board[move] == ' '
    puts "Invalid move."
  end
  board[move] = PLAYER_MARKER
end

def computer_moves!(board)
  puts "Computer's turn..."
  sleep 0.5
  move = empty_squares(board).sample
  board[move] = COMPUTER_MARKER
end

def someone_won_round?(board)
  !!detect_round_winner(board)
end

def detect_round_winner(board)
  WINNING_LINES.each do |line|
    if line.all? { |square| board[square] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |square| board[square] == COMPUTER_MARKER }
      return 'Computer'
    end
  end
  nil
end

def someone_won_game?(score)
  !!detect_game_winner(score)
end

def detect_game_winner(score)
  return 'Player' if score[0] >= 5
  return 'Computer' if score[1] >= 5
end

def board_full?(board)
  empty_squares(board).empty?
end

# Start of game
puts "Welcome to Tic-Tac-Toe! First to 5 wins!"

loop do
  score = [0, 0]
  round = 1

  # Start of round
  loop do
    board = initialize_board

    loop do
      display_score(score, round)
      display_board(board)

      player_moves!(board)
      break if someone_won_round?(board) || board_full?(board)

      computer_moves!(board)
      break if someone_won_round?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won_round?(board)
      update_score(score, detect_round_winner(board))
      display_score(score, round)
      display_board(board)
      prompt("#{detect_round_winner(board)} won Round #{round}!")
    else
      display_score(score, round)
      display_board(board)
      prompt("It's a tie!")
    end
    sleep 5

    break if someone_won_game?(score)
    round += 1
  end

  prompt("#{detect_game_winner(score)} won the game in #{round} rounds!")

  # prompt user if they would like to play again
  answer = ''

  loop do
    prompt("Would you like to play again? (Y/N)")
    answer = gets.chomp.downcase
    break if ['y', 'n', 'yes', 'no'].include?(answer)
    prompt("Invalid response.")
  end

  break if ['n', 'no'].include?(answer)
end

prompt("Good bye!")
