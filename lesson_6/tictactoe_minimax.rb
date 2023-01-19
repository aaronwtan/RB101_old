# Ruby simulation of the game of Tic-Tac-Toe played
# against the computer using the minimax algorithm
# require 'pry'

# uncomment to configure setting for first move
# FIRST_MOVE = 'player'
# FIRST_MOVE = 'computer'
FIRST_MOVE = 'choose'

PLAYERS = ['player', 'computer']

EMPTY_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]]            # diagonals

VALUES = { 'Computer' => 10, 'Player' => -10, 'tie' => 0 }

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

def display_round_header(round)
  system 'clear'
  header = "Round #{round}"
  puts header
  puts '-' * header.length
end

def display_score(score)
  puts "Player: #{score['Player']}"
  puts "Computer: #{score['Computer']}"
end

def update_score!(score, winner)
  score[winner] += 1
end

def place_piece!(board, current_player)
  current_player == 'player' ? player_moves!(board) : computer_moves!(board)
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def player_moves!(board)
  move = ''

  loop do
    prompt("Choose a square: #{joinor(empty_squares(board))}")
    move = gets.to_i
    break if empty_squares(board).include?(move)

    puts "Invalid move."
  end

  board[move] = PLAYER_MARKER
end

def computer_moves!(board)
  puts "Computer's turn..."
  sleep 0.5

  move = find_best_move(board)
  board[move] = COMPUTER_MARKER
end

def find_best_move(board)
  best_move = empty_squares(board).first
  best_value = -Float::INFINITY

  empty_squares(board).each do |move|
    board[move] = COMPUTER_MARKER
    move_value = minimax(board, 0, false)
    board[move] = EMPTY_MARKER

    return empty_squares(board).sample if move_value == Float::INFINITY

    if move_value > best_value
      best_move = move
      best_value = move_value
    end
  end
  best_move
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def minimax(board, depth, is_maximizing)
  return Float::INFINITY if depth > 5

  if someone_won_round?(board)
    return VALUES[detect_round_winner(board)]
  elsif board_full?(board)
    return VALUES['tie']
  end

  if is_maximizing
    best_value = -Float::INFINITY

    empty_squares(board).each do |move|
      board[move] = COMPUTER_MARKER
      move_value = minimax(board, depth + 1, !is_maximizing) - depth
      best_value = [move_value, best_value].max
      board[move] = EMPTY_MARKER
    end
  else
    best_value = Float::INFINITY

    empty_squares(board).each do |move|
      board[move] = PLAYER_MARKER
      move_value = minimax(board, depth + 1, !is_maximizing) + depth
      best_value = [move_value, best_value].min
      board[move] = EMPTY_MARKER
    end
  end

  best_value
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def find_at_risk_square(board, line, marker)
  if line.count { |square| board[square] == marker } == 2
    line.select { |square| board[square] == EMPTY_MARKER }.first
  end
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

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won_game?(score)
  !!detect_game_winner(score)
end

def detect_game_winner(score)
  score.key(5)
end

# start of game
prompt("Welcome to Tic-Tac-Toe! First to 5 wins!")

# start of main game loop
loop do
  # set who goes first based on configuration of FIRST_MOVE
  case FIRST_MOVE
  when 'player'   then first_move = 'player'
  when 'computer' then first_move = 'computer'
  when 'choose'
    loop do
      prompt("Who would you like to go first? (#{joinor(PLAYERS)})")
      first_move = gets.chomp
      break if PLAYERS.include?(first_move)

      prompt("Invalid choice. Please choose #{joinor(PLAYERS)}.")
    end
  end

  score = { 'Player' => 0, 'Computer' => 0 }
  round = 1

  # start of round
  loop do
    board = initialize_board
    current_player = first_move

    # loop through player and computer moves until someone wins or board is full
    loop do
      display_round_header(round)
      display_score(score)
      display_board(board)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won_round?(board) || board_full?(board)
    end

    # display results of round
    if someone_won_round?(board)
      update_score!(score, detect_round_winner(board))
      display_round_header(round)
      display_score(score)
      display_board(board)
      prompt("#{detect_round_winner(board)} won Round #{round}!")
    else
      display_round_header(round)
      display_score(score)
      display_board(board)
      prompt("It's a tie!")
    end
    sleep 1

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
