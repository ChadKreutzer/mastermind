# Master Class for Guesser and Master
class Player
  CODE_PEGS = [:red, :blue, :yellow, :green, :white, :black].freeze
  KEY_PEGS = [:black, :white].freeze

  private

  def generate_code
    code = []
    4.times { code.push(CODE_PEGS.sample) }
    code
  end

  def validate_choices?(player_choice)
    !player_choice.all? { |x| x =~ /(red|blue|yellow|green|white|black)/ }
  end

  def validate_length?(player_choice)
    player_choice.length != 4
  end

  def input
    gets.chomp
  end
end
