require "spec_helper"

module Mastermind
	describe Game do 
		context "#create_hint" do
			it "returns correct hint" do 
				input = ["Blue", "Red", "Yellow", "Green"] 
				game = Game.new(["Blue", "Purple", "Orange", "Yellow"])
				expect(game.create_hint(input)).to eq ["Black", "_", "White", "_"]
			end
		end
	end
end