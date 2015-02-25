require_relative 'response'
require_relative 'mastermind_string_validator'

class Mastermind
  attr_reader :secret

  def initialize
    @secret = generate_colors
    @validator = MastermindStringValidator.new(input: secret.join)
  end

  def colors
    @secret
  end

  def execute(input)
    @input = input.upcase
    case
    when input == "Q"
      [:exit_game, :next_time]
    when input.length > 4
      [:continue, :too_long]
    when input.length < 4
      [:continue, :too_short]
    end

    if @validator.guess?(input)
      [:exit_game,:won]
    else
      puts "Color Count: #{@validator.color_count}"
      puts "Position Count: #{@validator.position_count}"
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
