class Response
  attr_reader :message, :status

  # def initialize
  #   @message = [:message]
  #   @status  = [:status]
  # end

  def greeting
  print "\e[2J\e[f"

  puts'  /\/\   __ _ ___| |_ ___ _ __ _ __ ___ (_)_ __   __| | '
  puts' /    \ / _` / __| __/ _ \  __|  _ ` _ \| |  _ \ / _` | '
  puts'/ /\/\ \ (_| \__ \ ||  __/ |  | | | | | | | | | | (_| | '
  puts'\/    \/\__,_|___/\__\___|_|  |_| |_| |_|_|_| |_|\__,_| '

  puts "\n"
  puts "\n"
  puts "\n"
  end

  def menu
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def play_game
    puts "AWESOME! What's your first guess?"
  end

  def info
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def won
    puts "You Win!"
  end

  def continue
    puts "Guess again!"
  end

  def too_short
    puts "Your guess is too short!"
  end

  def too_long
    puts "Your guess is too long!"
  end

  def next_time
    puts "Try again next time!"
  end

  def exit_game
    puts "Thanks for playing!"
  end

  def guess_wrong
    puts "Incorrect guess!"
  end
end
