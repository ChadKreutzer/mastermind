require_relative 'player'
# The Code Creator Class
class Master < Player
  CORRECT_GUESS = [:black, :black, :black, :black].freeze
  attr_accessor :key_hints, :secret_code
  attr_writer :guess

  def initialize
    @secret_code = generate_code
    @key_hints = []
  end

  def validate_guess(player_choice)
    if player_choice == @secret_code
      @key_hints = CORRECT_GUESS
    else
      check_for_white_matches(check_for_black_matches(player_choice))
    end
  end

  def display_secret_code
    @secret_code.join('|')
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
