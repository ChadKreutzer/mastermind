require 'minitest/autorun'
Dir['./lib/*'].each { |file_name| require file_name }

class MastermindTest < Minitest::Test
  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

# Master tests
  def test_secret_code_is_array_with_length_of_4
    expected = 4
    assert_equal expected, ::Master.new.secret_code.length
  end

  def test_secret_code_is_made_of_symbols
    expected = true
    assert_equal expected, ::Master.new.secret_code.all? do |peg|
      peg.is_a?(Symbol)
    end
  end

  def test_correct_guess
    m = Master.new
    m.secret_code = [:RD, :BU, :YW, :WT]
    m.validate_guess([:RD, :BU, :YW, :WT])
    expected = [:BK, :BK, :BK, :BK]
    assert_equal expected, m.key_hints
  end

  def test_wrong_guess_with_both_black_and_white
    m = Master.new
    m.secret_code = [:RD, :BU, :YW, :WT]
    m.validate_guess([:BK, :BU, :WT, :GR])
    expected = [:BK, :WT]
    assert_equal expected, m.key_hints
  end

# Guesser tests
  def test_player_guess
    expected = [:YW, :RD, :BU, :WT]
    assert_equal expected, ::Guesser.new.guess('yellow red blue white')
  end

  def test_player_guess_is_wrong_length
    with_stdin do |user|
      user.puts 'yellow red blue white'
      b = Guesser.new
      expected = [:YW, :RD, :BU, :WT]
      assert_equal expected, b.guess('yellow red blue')
    end
  end

  def test_player_guess_contains_invalid_choices
    with_stdin do |user|
      user.puts 'yellow red blue white'
      b = Guesser.new
      expected = [:YW, :RD, :BU, :WT]
      assert_equal expected, b.guess('yellow red blue purple')
    end
  end

# Board Tests
  def test_display_secret_code_is_colors_divided_by_pipes
    expected = '|RD|BU|YW|WT|'
    assert_equal expected, ::Board.new.display_pegs([:RD, :BU, :YW, :WT])
  end

  def test_initial_board_displays_correctly
    expected = <<-GAMEBOARD
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
    GAMEBOARD
    assert_equal expected, ::Board.new.display_board
  end

  def test_board_display_first_guess_correctly
    b = Board.new
    b.new_guess(0, [:RD, :BU, :YW, :WT])
    expected = <<-GAMEBOARD
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|  |  |  |  |||  |  |  |  |
|RD|BU|YW|WT|||  |  |  |  |
    GAMEBOARD
    assert_equal expected, b.display_board
  end
end
