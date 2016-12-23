# Master Class for Guesser and Master
class Player
  CODE_PEGS = { 'red'   => :RD, 'blue'  => :BU, 'yellow' => :YW,
                'green' => :GR, 'white' => :WT, 'black'  => :BK }.freeze

  private

  def generate_code
    code = []
    4.times { code.push(CODE_PEGS.keys.sample) }
    code
  end

  def not_valid_choice?(player_choice)
    !player_choice.all? { |x| x =~ /(red|blue|yellow|green|white|black)/ }
  end

  def not_valid_length?(player_choice)
    player_choice.length != 4
  end
end
