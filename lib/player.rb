class Player
  CODE_PEGS = [:red, :blue, :yellow, :green, :white, :black].freeze
  KEY_PEGS = [:black, :white].freeze
  
  private

  def generate_code
    code = []
    4.times { code.push(CODE_PEGS.sample) }
    code
  end
end