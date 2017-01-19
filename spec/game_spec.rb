require "spec_helper"

module Mastermind
	describe Game do 
		let(:user) { Player.new({name: "Zach", side: "Codemaker"}) }
		let(:computer) { Player.new({name: "Computer", side: "Codebreaker"}) }

		context "#initialize" do 
			it "doesn't raise an error" do 
				players = [user, computer]
				expect { Game.new(players) }.to_not raise_error
			end

			it "returns the codemaker" do 
				players = [user, computer]
				game = Game.new(players)
				expect(game.codemaker).to eq user
			end

			it "returns the codebreaker" do 
				players = [user, computer]
				game = Game.new(players)
				expect(game.codebreaker).to eq computer
			end
		end

		context "#correct_code?" do
			it "returns true if hint values are all 'Bl'" do 
				input = ["B", "R", "Y", "G"]
				hint = ["Bl", "Bl", "Bl", "Bl"]
				secret_code = ["B", "R", "Y", "G"] 
				players = [user, computer]
				game = Game.new(players)
				expect(game.correct_code?(input, hint, secret_code)).to eq true
			end

			it "returns false if hint values are not all 'Bl'" do 
				input = ["G", "R", "B", "Y"]
				hint = ["Bl", "W", "_", "_"]
				secret_code = ["R", "O", "P", "B"]
				players = [user, computer]
				game = Game.new(players)
				expect(game.correct_code?(input, hint, secret_code)).to eq false
			end
		end

		context "#random_code" do 
			it "returns an array of String type objects" do 
				players = [user, computer]
				game = Game.new(players) 
				secret_code = game.random_code
				secret_code.each do |color|
					expect(color).to be_a(String)
				end
			end

			it "returns an array with 4 objects" do 
				players = [user, computer]
				game = Game.new(players)
				secret_code = game.random_code
				expect(secret_code.size).to eq 4
			end
		end	

		context "#get_hint" do 
			it "returns correct hint values" do 
				answer = "PPPP".split("")
				secret_code = "PBOY".split("")
				players = [user, computer]
				game = Game.new(players)
				expect(game.get_hint(answer, secret_code)).to eq ["Bl", "W", "W", "W"]
			end

			it "returns empty array when given all wrong answers" do 
				answer = "BYGR".split("")
				secret_code = "BBBB".split("")
				players = [user, computer]
				game = Game.new(players)
				expect(game.get_hint(answer, secret_code)).to eq ["Bl", "_", "_", "_"]
			end
		end
	end
end

			
