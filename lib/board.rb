require_relative 'master'
require_relative 'guesser'
require_relative 'helper'
# Board for playing the game
class Board
  include Helper
  def initialize
    @row = []
    @board = Array.new(12)
    @code_master = Master.new
    @code_breaker = Guesser.new
  end

  def display_pegs(pegs)
    "|#{pegs.join('|')}|"
  end
end
