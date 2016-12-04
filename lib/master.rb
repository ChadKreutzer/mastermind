require_relative 'player'
require_relative 'helper'
# The Code Creator Class
class Master < Player
  include Helper
  CORRECT_GUESS = [:black, :black, :black, :black].freeze
  attr_accessor :key_hints, :secret_code
  attr_writer :guess

  def initialize
    @secret_code = generate_code
    @key_hints = []
  end

  def validate_guess(player_choice)
    check_for_white_matches(
      check_for_black_matches(
        player_choice
      )
    )
  end

  private

  def check_for_black_matches(player_choice)
    choice_minus_blacks = []
    player_choice.each_with_index do |peg, index|
      if @secret_code[index] == peg
        @key_hints.push(:black)
      else
        choice_minus_blacks.push(peg)
      end
    end
    choice_minus_blacks
  end

  def check_for_white_matches(player_choice)
    player_choice.each do |peg|
      @key_hints.push(:white) if @secret_code.any? { |x| x == peg }
    end
  end
end
