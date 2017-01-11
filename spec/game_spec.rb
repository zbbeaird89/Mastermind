require "spec_helper"

module Mastermind
	describe Game do 
		context "#correct_code?" do
			it "returns true if hint values are all 'Bl'" do 
				input = ["B", "R", "Y", "G"]
				hint = ["Bl", "Bl", "Bl", "Bl"]
				secret_code = ["B", "R", "Y", "G"] 
				game = Game.new
				expect(game.correct_code?(input, hint, secret_code)).to eq true
			end

			it "returns false if hint values are not all 'Bl'" do 
				input = ["G", "R", "B", "Y"]
				hint = ["Bl", "W", "_", "_"]
				secret_code = ["R", "O", "P", "B"]
				game = Game.new
				expect(game.correct_code?(input, hint, secret_code)).to eq false
			end
		end

		context "#make_code" do 
			it "returns an array of String type objects" do 
				game = Game.new 
				secret_code = game.make_code
				secret_code.each do |color|
					expect(color).to be_a(String)
				end
			end

			it "returns an array with 4 objects" do 
				game = Game.new
				secret_code = game.make_code
				expect(secret_code.size).to eq 4
			end
		end	

		context "#pick" do 
			it "returns a string" do 
				colors = ["B", "G", "P", "R", "O", "Y"]
				array = []
				game = Game.new
				expect(game.pick(colors, array)).to be_a(String)
			end
		end

		context "#get_hint" do 
			it "returns correct hint values" do 
				answer = "PPPP".split("")
				secret_code = "PBOY".split("")
				game = Game.new
				expect(game.get_hint(answer, secret_code)).to eq ["Bl", "W", "W", "W"]
			end

			it "returns empty array when given all wrong answers" do 
				answer = "BYGR".split("")
				secret_code = "BBBB".split("")
				game = Game.new
				expect(game.get_hint(answer, secret_code)).to eq ["Bl", "_", "_", "_"]
			end
		end	
	end
end