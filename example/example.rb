=begin

	Mastermind is a game where 2 players play on a board. 1 player (the codemaker) will place 4 
	colored pegs in a sequence (this is the code). The other player (the codebreaker) will
	have 12 turns to guess the secret code. After each turn the codebreaker will be provided with
	a hint. The hint will consist of 4 spaces just like the board rows. If the codebreaker guesses
	a correct color and position, a space will be occupied by a black peg. If the codebreaker 
	guesses a correct color but not the position, a space will be occupied by a white peg. If 
	the codebreaker cracks the code he is the winner. If not then game over.



	- Game

	- Player

	- Board

	- Hole




=end


require "../lib/mastermind.rb"

puts "Welcome to Mastermind!"

puts "What is your name?"

user_name = gets.chomp

human_player = Mastermind::Player.new({name: user_name, side: "Code Breaker"})
computer = Mastermind::Player.new({name: "Computer", side: "Code Maker"})

players = [human_player, computer]

Mastermind::Game.new(players).play