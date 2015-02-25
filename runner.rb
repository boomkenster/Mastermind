require_relative "mastermind"
require_relative "response"

mastermind = Mastermind.new
response = nil

response = Response.new
response.greeting
response.menu

 input = gets.chomp

 continue = true
 while continue
 if input == "p"
   response.play_game
   mm = Mastermind.new
 elsif input == "c"
   puts "Made a game with secret:#{mastermind.colors}"
 elsif input == "i"
   response.info
 elsif input == "q"
   response.exit_game
   break
 end

  print "> "
  input = gets.chomp
  guess = mastermind.execute(input)
  signal = guess[0]
  message = guess[1]
  response.send(signal)
  response.send(message)
  if signal == :exit_game
    continue = false
  end
end
puts "Goodbye!"
