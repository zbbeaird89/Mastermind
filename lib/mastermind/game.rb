module Mastermind
	class Game
		attr_reader :codemaker, :codebreaker

		@@possible_colors = ["B", "G", "P", "R", "O", "Y"] 
		@@rows = []

		def initialize(players)
			players.each do |player|
				if player.side == "Codemaker"
					@codemaker = player
				else
					@codebreaker = player
				end
			end
		end

		def play
			secret_code = make_code
			game_over = nil

			while @@rows.size <= 12
				prompt_user
				answer = gets.chomp.upcase.split("")
				hint = get_hint(answer, secret_code)
				comparison = correct_code?(answer, hint, secret_code)
				if comparison == false
					@@rows.push(Row.new(answer, hint))
				elsif comparison == true
					puts "#{answer} is the secret code! You win!"
					game_over = true
					break
				end
			end

			unless game_over
				puts "Sorry, the secret code was #{secret_code}. Game over."
			end
		end

		def make_code
			array = []
			4.times do 
				array << pick(@@possible_colors, array)
			end
			return array
		end

		# Displays the whole board before player can answer
		def prompt_user
			puts "\n \n \n \n"
			puts "_ _ _ _  ( _ _ _ _ )"
			display_rows
		end

		def correct_code?(input, hint, secret_code)
			if hint.all? { |color| color == "Bl" }
				return true
			else
				return false
			end
		end

		def get_hint(answer, secret_code)
			array = []
			answer.each_with_index do |color, i|
				color_check = secret_code.include?(color) 
				position_check = (i == secret_code.index(color))
				array << hint_value(color_check, position_check)
			end
			return array.sort
		end


		private


		def pick(colors, array) 
			picked = colors[rand(0...colors.length)]
			unless array.include?(picked)
				return picked
			else
				pick(colors, array)
			end
		end

		def display_rows
			if @@rows.size > 0
				@@rows.each do |row| 
					answers = row.answer.collect { |cell| cell.value }
					hints = row.hint.collect { |cell| cell.value }
					puts "#{answers.join(" ")}  (#{hints.join(" ")})"
				end
			end
		end

		#Checks if value for hint should be either white or black
		def hint_value(color_check, position_check)
			if color_check && position_check
				return "Bl"
			elsif color_check || position_check 
				return "W"
			else
				return "_"
			end
		end

	end
end