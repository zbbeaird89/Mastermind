require "spec_helper"

module Mastermind
	describe Game do 
		context "#compare_codes" do
			it "returns true if user input and secret_code are the same" do 
				input = ["B", "R", "Y", "G"]
				secret_code = ["B", "R", "Y", "G"] 
				game = Game.new
				expect(game.compare_codes(input, secret_code)).to eq true
			end

			it "returns hint if input and code are not the same" do 
				input = ["G", "R", "B", "Y"]
				secret_code = ["R", "O", "P", "B"]
				game = Game.new
				expect(game.compare_codes(input, secret_code)).to eq ["W", "W", "_", "_"]
			end
		end

		context "#make_code" do 
			it "returns an array of String type objects" do 
				game = Game.new 
				secret_code = game.make_code
				secret_code.each do |color|
					expect(color).to be_an(String)
				end
			end

			it "returns an array with 4 objects" do 
				game = Game.new
				secret_code = game.make_code
				expect(secret_code.size).to eq 4
			end
		end	

		context "#set_answer" do 
			it "user input is stored in :answer" do 
				game = Game.new
				row = Row.new
				input = ["B", "Y", "R", "G"]
				game.set_answer(row, input)
				row.answer.each_with_index do |cell, i|
					expect(cell.value).to eq input[i]
				end
			end
		end
	end
end