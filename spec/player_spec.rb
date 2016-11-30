require "spec_helper"

module Mastermind
	describe Player do 
		context "#initialize" do 
			it "raises exception when given {}" do 
				expect { Player.new }.to raise_error(KeyError)
			end

			it "passes when correct input is given" do 
				player = Player.new({name: "Zach", side: "Codemaker"})
				expect { player }.to_not raise_error
			end	
		end

		context "#name" do 
			it "returns a name" do 
				player = Player.new({name: "Zach", side: "Codemaker"})
				expect(player.name).to eq "Zach"
			end
		end

		context "#side" do 
			it "returns a side" do 
				player = Player.new({name: "Zach", side: "Codemaker"})
				expect(player.side).to eq "Codemaker"
			end
		end		
	end
end