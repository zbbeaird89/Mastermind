require_relative "../lib/mastermind.rb"

puts ""
puts ""

puts %q[	Mastermind is a game where 2 players play on a board. 1 player 
	(the codemaker) will place 4 colored pegs in a sequence (this is the 
	code). The other player (the codebreaker) will have 12 turns to guess
	the secret code. After each turn the codebreaker will be provided with
	a hint. The hint will consist of 4 spaces just like the board rows. If
	the codebreaker guesses a correct color and position, a space in the
	hint row will be occupied by a black peg. If the codebreaker guesses 
	a correct color but not the position, a space will be occupied by a 
	white peg. If the codebreaker cracks the code he/she is the winner. If 
	not then game over.]

puts ""
puts ""

puts %q[Your color choices are:
B => Blue
G => Green
P => Purple
R => Red
O => Orange
Y => Yellow

The hints you receive will be:
Bl => Black
W => White]

puts "Will you be the Codemaker or the Codebreaker?"

side = gets.chomp.capitalize
choices = ["Codemaker", "Codebreaker"]

user = Player.new(side)
computer = Player.new

#sets computer side to opposite of user
choices.each do |string|
	unless user.side == string
		computer.side = string
	end
end 

players = [user, computer]


Mastermind::Game.new().play



