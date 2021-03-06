class MastermindStringValidator

  def initialize(input:)
    @input = input
  end

  def guess?(guess)
    @current_guess = guess
    if guess == @input
      true
    end
  end

  def guess_too_long?(input)
    input.chars.length > 4
  end

  def guess_too_short?(input)
    input.chars.length < 4
  end

  def color_count
    guess_letters = @current_guess.chars
    input_array = @input.chars
    guess_letters.count do |letter|
      if input_array.include?(letter)
        input_array.delete_at(input_array.index(letter))
      end
    end
  end

  def position_count
    letters_split = @current_guess.chars
    input_array = @input.chars
    count = 0
    input_array.zip(letters_split) do |zipper|
      count +=1 if zipper[0] == zipper[1]
    end
    count
  end

end
