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

  def color_count
    guess_letters = @current_guess.chars
    # guess_letters.count{|letter| @input.chars.include?(letter)}
    count = 0
    input_array = @input.chars
    guess_letters.each do |letter|
      if input_array.include?(letter)
      count += 1
      input_array.delete_at(input_array.index(letter))
      end
    end
    count

  end
  def position_count
    letters_split = @current_guess.chars
    input_array = @input.chars
    counter = 0
    count = 0
     while count < 4
      if letters_split[count] == input_array[count]
        counter +=1
        count +=1
      else
        count +=1
      end
    end
    counter
  end

end
