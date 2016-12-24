module Mastermind
	class Game
		#attr_reader :player

		@@possible_colors = ["B", "G", "P", "R", "O", "Y"] 
		@@rows = []

		#def initialize(player)
			#@player = player
		#end

		def make_code
			array = []
			4.times do 
				array.push(@@possible_colors.sample)
			end
			return array
		end
		
		# Displays the whole board before player can answer
		def prompt_user
			puts "\n \n \n \n"
			puts "_ _ _ _  ( _ _ _ _ )"
			display_rows
		end

		def set_answer(row, input)
			answer = row.answer
			input.each_with_index do |value, i|
				row.set_cell(answer, i, value)
			end
		end

		def set_hint(row, input, secret_code)

		end

		def display_rows
			if @@rows.size > 0
				@@rows.each do |row| 
					answers = row.answer.collect { |cell| cell.value }
					hints = row.hint.collect { |cell| cell.value }
					puts "#{answers.join(" ")}  (#hints.join(" ")})"
				end
			end
		end


		def compare_codes(input, secret_code)
			hint = make_hint(input, secret_code)
			if hint.all? { |color| color == "Bl" }
				puts "#{input} is the secret code! You win!"
				return true
			else
				return hint
			end
		end

		def make_hint(input, secret_code)
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
=begin
		def play
			secret_code = make_code
			while @@rows.size < 12
				row = Row.new
				prompt_user
				input = gets.chomp.upcase.split("")
				answer = set_answer(row, input)
				hint = get_hint(row, input, secret_code)
				comparison = compare_codes(input, secret_code)
				unless comparison == true
					@@rows.push({answer: input, hint: comparison})
				else
					break
				end
			end
		end
=end
	end
end