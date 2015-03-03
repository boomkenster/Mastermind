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
    @counter += 1
    case
    when input == "Q"
      [:exit_game, :next_time]
    when @validator.guess_too_long?(input)
      puts "Number of guesses : #{@counter}"
      [:continue, :too_long]
    when @validator.guess_too_short?(input)
      puts "Number of guesses : #{@counter}"
      [:continue, :too_short]
    when @validator.guess?(input)
      [:exit_game,:won]
    else
      puts "Number of Colors Correct: #{@validator.color_count}"
      puts "Number of Positions Correct: #{@validator.position_count}"
      puts "You've guessed #{@counter}"
      [:guess_wrong, :continue]
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
