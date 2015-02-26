require_relative "mastermind"
require_relative "response"

mastermind = Mastermind.new
response = nil

response = Response.new
response.greeting
response.menu

 input = gets.chomp.upcase

 continue = true
 while continue
 if input == "P"
   response.play_game
   #mm = Mastermind.new
 elsif input == "C"
   puts "Made a game with secret:#{mastermind.colors}"
 elsif input == "I"
   response.info
 elsif input == "Q"
   response.exit_game
   break
 end

  print "> "
  input = gets.chomp.upcase
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
