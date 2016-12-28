Dir['./lib/*'].each { |file_name| require file_name }
# The Code Creator Class
class Master < Player
  # include Helper

  attr_accessor :key_hints, :secret_code

  def initialize
    @secret_code = generate_code
    @key_hints = []
  end

  def validate_guess(player_choice)
    @key_hints = []
    check_for_white_matches(check_for_black_matches(player_choice))
  end

  private

  def check_for_black_matches(player_choice)
    choice_minus_blacks = []
    player_choice.each_with_index do |peg, index|
      if @secret_code[index] == peg
        @key_hints.push(:BK)
      else
        choice_minus_blacks.push(peg)
      end
    end
    choice_minus_blacks
  end

  def check_for_white_matches(player_choice)
    player_choice.each_with_index do |peg, index|
      if @secret_code[index] != peg
        @key_hints.push(:WT) if @secret_code.any? { |x| x == peg }
      end
    end
  end
end
