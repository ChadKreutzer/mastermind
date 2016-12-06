require_relative 'master'
require_relative 'guesser'
require_relative 'board'
require_relative 'helper'

#Class for playing game
class Game
  CORRECT_GUESS = [:black, :black, :black, :black].freeze

  def initialize
    @turn = 0
    @game_board = Board.new
    @code_master = Master.new
    @code_breaker = Guesser.new
  end

  def turn(guess)
    @game_board.new_guess(guess)
    @game_board.new_hint(@code_master.validate_guess(guess))
    check_for_win
  end

  def check_for_win(hints)
    if hints == CORRECT_GUESS
      puts 'You win!'
      exit!
    elsif @turn == 12
      puts 'You lose! the Secret code was ' \
           "#{display_pegs(@code_master.secret_code)}"
      exit!
    else
      @turn += 1
    end
  end

end