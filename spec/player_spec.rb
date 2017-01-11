require "spec_helper"

module Mastermind
	describe Player do 
		context "#initialize" do 
			it "initializes with a string argument" do 
				player = Player.new("Codemaker")
				expect(player.side).to eq "Codemaker"
			end
		end

		context "#side" do 
			it "updates a side" do 
				player = Player.new("Codemaker")
				player.side = "Codebreaker"
				expect(player.side).to eq "Codebreaker"
			end
		end		
	end
end