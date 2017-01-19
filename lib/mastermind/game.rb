module Mastermind
	class Game
		attr_reader :codemaker, :codebreaker

		@@possible_colors = ["B", "G", "P", "R", "O", "Y"]
		@@c_answer = Array.new(4)
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

		def start
			if @codemaker.name == "Computer"
				secret_code = random_code
			else
				puts ""
				puts "Enter the secret code.\n(Must be 4 of possible colors. No duplicates)"
				secret_code = gets.chomp.upcase.split("")
			end	
			play(secret_code)
		end


		private


		def random_code
			array = []
			4.times do 
				array << pick(@@possible_colors, array)
			end
			return array
		end

		def play(secret_code)
			won = nil
			input = nil
			while @@rows.size <= 12
				if @codebreaker.name == "Computer"
					input = computer_prompt(secret_code)
				else
					user_prompt
					input = gets.chomp.upcase.split("")
				end
				answer = verify(input)
				hint = get_hint(answer, secret_code)
				comparison = correct_code?(answer, hint, secret_code)
				if comparison == false
					@@rows.push(Row.new(answer, hint))
				elsif comparison == true
					display_rows
					puts "#{answer} is the secret code! #{@codebreaker.name} wins!"
					won = true
					break
				end
			end
			lose_message(won, secret_code)
		end

		# Displays the whole board before player can answer
		def user_prompt
			puts "\n \n \n \n"
			puts "_ _ _ _  ( _ _ _ _ )"
			display_rows
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

		def verify(input)
			correct_length = input.length == 4
			correct_values = input.all? { |color| @@possible_colors.include?(color) }
			unless correct_length && correct_values
				user_prompt
				puts "Input must be 4 characters long and only include the listed color choices."
				input = gets.chomp.upcase.split("")
				verify(input)
			else
				return input
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

		def correct_code?(input, hint, secret_code)
			if hint.all? { |color| color == "Bl" }
				return true
			else
				return false
			end
		end

		def lose_message(won, secret_code)
			unless won
				display_rows
				puts "Sorry, the secret code was #{secret_code}. Game over."
			end
		end


#COMPUTER METHODS

		def computer_prompt(secret_code)
			if @@rows.length > 0
				blacks = find_bl(secret_code)
				whites = find_w(secret_code).uniq
				answer = place_colors(blacks, whites)
			else
				answer = random_code
			end
			return answer
		end

		def pick(colors, array) 
			picked = colors[rand(0...colors.length)]
			unless array.include?(picked)
				return picked
			else
				pick(colors, array)
			end
		end

		def find_bl(secret_code)
			array = Array.new(4)
			@@rows.last.answer.each_with_index do |color, i|
				color_check = secret_code.include?(color.value)
				position_check = (i == secret_code.index(color.value))
				if color_check && position_check
					array[i] = color.value	
				end
			end
			return array
		end

		def find_w(secret_code)
			array = []
			@@rows.last.answer.each_with_index do |color, i|
				color_check = secret_code.include?(color.value)
				position_check = (i == secret_code.index(color.value))
				if color_check && !position_check
					array.push(color.value)
				end
			end
			return array
		end
		
		def place_colors(blacks, whites)
			array = []
			blacks.each_with_index do |color, i|
				if color.is_a?(String)
					array.push(color)
				elsif color == nil
					if whites.length > 0
						array.push(whites.pop)
					else
						colors_left = @@possible_colors - all_answers
						array.push(colors_left.sample)
					end
				end
			end
			return array
		end
		
		def all_answers
			array = []
			@@rows.each do |row|
				row.answer.each do |color|
					array.push(color.value)
				end
			end
			return array
		end		

	end
end