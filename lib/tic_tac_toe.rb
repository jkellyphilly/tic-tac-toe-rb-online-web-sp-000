# Define the WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [6, 4, 2], # / diagonal
  [0, 4, 8] # \ diagonal
]

# Create a method to display the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Convert a user's input (1-9) to valid board index (0-8)
def input_to_index(user_input)
  user_input.to_i - 1
end

# Update the board with a player's move
def move(board, index, x_or_o)
  board[index] = x_or_o
end

# Clearly defines if a position is occupied on the board
def position_taken?(board, location)
  board[location] != " " && board[location] != "" && board[location] != nil
end

# Checks to see if a move is valid
def valid_move?(board, index)
  (index < 0 || index > 8) ? false : !position_taken?(board, index)
end

# Helper method for getting user's input and moving on the board
def turn(board)
  puts "Please enter 1-9:"
  #user_input = gets.strip.to_i
  user_index = input_to_index(gets.strip.to_i)

  # until the user's input is valid, keep running the test
  until valid_move?(board, user_index)
    puts "Not a valid user input."
    user_index = input_to_index(gets.strip.to_i)
  end

  move(board, user_index)
  display_board(board)
end

# Count how many turns have been played, given the current board
def turn_count(board)
  counter = 0
  board.each do | space |
    if (space == "X" || space == "O")
      counter += 1
    end
  end
  counter
end

# Determine whose turn it is based on the number of turns that have been played
# ASSUMPTION: player "X" goes first
def current_player(board)
  output = (turn_count(board) % 2) == 0 ? "X" : "O"
end
