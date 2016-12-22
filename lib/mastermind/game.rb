module Mastermind
	class Game
		attr_reader :player

		@@possible_colors = ["B", "G", "P", "R", "O", "Y"] 
		@@rows = []

		def initialize(player)
			@player = player
		end

		def play
			secret_code = create_code
			while @@rows.size < 12
				prompt_user
				answer = gets.chomp.split("")
				comparison = compare_codes(answer, secret_code)
				unless comparison == true
					@@rows.push({answer: answer, hint: comparison})
				else
					break
				end
			end
		end

		def create_code
			array = []
			4.times do 
				array.push(@@possible_colors.sample)
			end
			return array
		end

		def display_rows
			if @@rows.size > 0
				@@rows.each do |row| 
					puts "#{row[:answer].join(" ")}  (#{row[:hint].join(" ")})"
				end
			end
		end

		# Displays the whole board before player can answer
		def prompt_user
			puts "\n \n \n \n"
			puts "_ _ _ _  ( _ _ _ _ )"
			display_rows
		end

		def compare_codes(user_input, secret_code)
			hint = create_hint(user_input, secret_code)
			if hint.all? { |color| color == "Bl" }
				puts "#{user_input} is the secret code! You win!"
				return true
			else
				return hint
			end
		end

		def create_hint(input, secret_code)
			array = []
			input.each_with_index do |color, i|
				check_colors = secret_code.include?(color) 
				check_positions = i == secret_code.index(color)
				array << hint_value(check_colors, check_positions)
			end
			return array.sort
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