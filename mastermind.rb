require_relative 'response'
require_relative 'mastermind_string_validator'

class Mastermind
  attr_reader :secret

  def initialize
    @secret = generate_colors
    @validator = MastermindStringValidator.new(input: secret.join)
    @counter = 0
  end

  def colors
    @secret
  end

  def execute(input)
    case
    when input == "Q"
      [:exit_game, :next_time]
    when input.length > 4
      @counter += 1
      puts "Number of guesses : #{@counter}"
      [:continue, :too_long]
    when input.length < 4
      @counter += 1
      puts "Number of guesses : #{@counter}"
      [:continue, :too_short]
    when @validator.guess?(input)
      @counter += 1
      [:exit_game,:won]
    else
      @counter += 1
      puts "Correct Color Count: #{@validator.color_count}"
      puts "Correct Position Count: #{@validator.position_count}"
      puts "Number of guesses : #{@counter}"
      [:continue,:guess_wrong]
    end
  end

  private

  def generate_colors
    colors = ["R","G","B","Y"]
    4.times.map do
      colors.shuffle.first
    end
  end
end
