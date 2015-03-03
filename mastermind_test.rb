require 'minitest/autorun'
require 'minitest/pride'
require './mastermind'

class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.include?(:won)
  end

  def test_it_goes_to_info_when
    response = Response.new
    assert_equal = "Info", response.info
  end

  def test_it_continues_after_wrong_guess
    mm = Mastermind.new
    result = mm.execute("GGBG")
    assert result.include?(:guess_wrong)
  end

  def test_it_creates_random_colors
    mm = Mastermind.new
    pattern = mm.colors
    assert 4 , pattern.length
  end

  def test_when_more_than_4_message_appears
    mm = Mastermind.new
    assert_equal [:continue, :too_long], mm.execute("aaaaa")
  end

  def test_when_lower_case_entry_is_valid
    skip
    mm = Mastermind.new
    mm.execute("rrrr")
    assert_equal "RRRR", mm.input
  end

end
