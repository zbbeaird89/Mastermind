module Mastermind
	class Game
		attr_reader :secret_code
		def initialize(code)
			@secret_code = code
		end
		def create_hint(input)
			array = []
			input.each_with_index do |color, i|
				check_colors = @secret_code.include?(color) 
				check_positions = i == @secret_code.index(color)
				array << hint_value(check_colors, check_positions)
			end
			return array
		end

		def hint_value(check_colors, check_positions)
			if check_colors && check_positions
				"Black"
			elsif check_colors || check_positions
				"White"
			else
				"_"
			end
		end

		colors = {
			"1": "Blue",
			"2": "Red",
			"3": "Orange",
			"4": "Green",
			"5": "Purple",
			"6": "Yellow"
		}
	end
end