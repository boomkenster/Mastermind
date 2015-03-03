require 'minitest/autorun'
require 'minitest/pride'
require './mastermind_string_validator'
require 'pry'

class MastermindStringValidatorTest < Minitest::Test

  def test_string_matches
    validator = MastermindStringValidator.new(input: 'YYYY')
    assert validator.guess?('YYYY')
  end

  def test_string_matches
    validator = MastermindStringValidator.new(input: 'YYYY')
    refute validator.guess?("XXXX")
    assert_equal 0, validator.color_count
    assert_equal 0, validator.position_count
  end

  def test_guess_too_long
    validator = MastermindStringValidator.new(input: 'XXXX')

    assert_equal false, validator.guess_too_long?("FFFF")
    assert_equal true, validator.guess_too_long?("AAAAA")
  end

  def test_guess_too_short
    validator = MastermindStringValidator.new(input: 'XXYX')

    assert_equal false, validator.guess_too_short?("FFFF")
    assert_equal true, validator.guess_too_short?("AAA")
  end

  def test_color_count
    validator = MastermindStringValidator.new(input: 'XXYX')

    refute validator.guess?("FFFF")
    assert_equal 0, validator.color_count

    refute validator.guess?("XFFF")
    assert_equal 1, validator.color_count

    refute validator.guess?("YYYF")
    assert_equal 1, validator.color_count

    refute validator.guess?("XYYF")
    assert_equal 2, validator.color_count

    assert validator.guess?("XXYX")
    assert_equal 4, validator.color_count

    refute validator.guess?("FXYX")
    assert_equal 3, validator.color_count
  end


  def test_position_count
    validator = MastermindStringValidator.new(input: 'XXYX')

    refute validator.guess?("FFFF")
    assert_equal 0, validator.position_count

    refute validator.guess?("XFFF")
    assert_equal 1, validator.position_count

    refute validator.guess?("YYYF")
    assert_equal 1, validator.position_count

    refute validator.guess?("XYYF")
    assert_equal 2, validator.position_count
  end

  #for each guess, increment count by one

end
