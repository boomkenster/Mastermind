require_relative "mastermind"
require_relative "response"

mastermind = Mastermind.new
response = nil

response = Response.new
response.greeting
response.menu

input = gets.chomp.upcase
start_timer = Time.now
continue = true
while continue
  if input == "P"
    response.play_game
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
  signal, message = guess
  response.send(signal)
  response.send(message)
  if signal == :exit_game
    end_timer = Time.now
    complete_time = end_timer - start_timer
    puts "You've guessed in #{'%0.2f'%complete_time}sec"
    continue = false
  end
end
puts "Goodbye!"
