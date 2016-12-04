require 'minitest/autorun'
require_relative '../lib/master'
require_relative '../lib/guesser'
require_relative '../lib/board'

class MastermindTest < Minitest::Test
  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

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

  def test_display_secret_code_is_colors_divided_by_pipes
    expected = '|red|blue|yellow|white|'
    assert_equal expected, ::Board.new.display_pegs([:red,    :blue,
                                                     :yellow, :white])
  end

  def test_correct_guess
    m = Master.new
    m.secret_code = [:red, :blue, :yellow, :white]
    m.validate_guess([:red, :blue, :yellow, :white])
    expected = [:black, :black, :black, :black]
    assert_equal expected, m.key_hints
  end

  def test_wrong_guess_with_both_black_and_white
    m = Master.new
    m.secret_code = [:red, :blue, :yellow, :white]
    m.validate_guess([:black, :blue, :white, :green])
    expected = [:black, :white]
    assert_equal expected, m.key_hints
  end

  def test_player_guess
    expected = [:yellow, :red, :blue, :white]
    assert_equal expected, ::Guesser.new.guess('yellow red blue white')
  end

  def test_player_guess_is_wrong_length
    with_stdin do |user|
      user.puts 'yellow red blue white'
      b = Guesser.new
      expected = [:yellow, :red, :blue, :white]
      assert_equal expected, b.guess('yellow red blue')
    end
  end

  def test_player_guess_contains_invalid_choices
    with_stdin do |user|
      user.puts 'yellow red blue white'
      b = Guesser.new
      expected = [:yellow, :red, :blue, :white]
      assert_equal expected, b.guess('yellow red blue purple')
    end
  end
end
