require "spec_helper"

module Mastermind
	describe Game do 
		let(:bob) { Player.new({name: "Bob", side: "Code Breaker"}) }

		context "#initialize" do 
			it "passes when given an array of Player objects" do 
				player = bob
				expect { Game.new(player) }.to_not raise_error
			end

			it "returns the players" do 
				player = bob
				game = Game.new(player)
				expect(game.player).to eq player
			end
		end

		context "#compare_codes" do
			it "returns true if user input and secret_code are the same" do 
				player = bob
				input = ["B", "R", "Y", "G"]
				secret_code = ["B", "R", "Y", "G"] 
				game = Game.new(player)
				expect(game.compare_codes(input, secret_code)).to eq true
			end

			it "returns hint if input and code are not the same" do 
				player = bob
				input = ["G", "R", "B", "Y"]
				secret_code = ["R", "O", "P", "B"]
				game = Game.new(player)
				expect(game.compare_codes(input, secret_code)).to eq ["W", "W", "_", "_"]
			end
		end

		context "#create_code" do 
			it "returns an array of String type objects" do 
				player = bob
				game = Game.new(bob) 
				secret_code = game.create_code
				secret_code.each do |color|
					expect(color).to be_an(String)
				end
			end

			it "returns an array with 4 objects" do 
				player = bob
				game = Game.new(bob)
				secret_code = game.create_code
				expect(secret_code.size).to eq 4
			end
		end	
	end
end