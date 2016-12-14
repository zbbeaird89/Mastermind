module Mastermind
	class Game
		attr_reader :players, :board

		@@possible_colors = ["B", "G", "P", "R", "O", "Y"] 
		@@rows = []

		def initialize(players, board = Board.new)
			@players = players
			@board = board
		end

		def compare_codes(user_input, secret_code)
			hint = create_hint(user_input, secret_code)
			return true if hint.all? { |color| color == "Bl" }
			return false
		end

		def play

		end


		private

		def create_hint(input, secret_code)
			array = []
			input.each_with_index do |color, i|
				check_colors = secret_code.include?(color) 
				check_positions = i == secret_code.index(color)
				array << hint_value(check_colors, check_positions)
			end
			return array
		end

		#Checks if value for hint should be either white or black
		def hint_value(check_colors, check_positions)
			if check_colors && check_positions
				"Bl"
			elsif check_colors || check_positions
				"W"
			else
				"_"
			end
		end
	end
end