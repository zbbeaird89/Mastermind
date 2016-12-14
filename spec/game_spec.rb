require "spec_helper"

module Mastermind
	describe Game do 
		let(:bob) { Player.new({name: "Bob", side: "Code Breaker"}) }
		let(:computer) { Player.new({name: "Computer", side: "Code Maker"}) }

		context "#initialize" do 
			it "passes when given an array of Player objects" do 
				players = [bob, computer]
				expect { Game.new(players) }.to_not raise_error
			end

			it "creates a Board object by default" do 
				players = [bob, computer]
				game = Game.new(players)
				check = game.board
				expect(game.board).to eq check 
			end

			it "returns the players" do 
				players = [bob, computer]
				game = Game.new(players)
				expect(game.players).to eq players
			end
		end

		context "#create_hint" do
			it "returns correct hint" do 
				players = [bob, computer]
				input = ["B", "R", "Y", "G"]
				secret_code = ["B", "P", "O", "Y"] 
				game = Game.new(players)
				expect(game.create_hint(input, secret_code)).to eq ["Bl", "_", "W", "_"]
			end
		end
	end
end