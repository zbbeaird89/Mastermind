require "spec_helper"

module Mastermind
	describe Hole do 
		context "#initialize" do 
			it "creates an empty string by default" do 
				hole = Hole.new
				expect(hole.value).to eq ""
			end 

			it "excepts 'Blue' as a value" do 
				hole = Hole.new("Blue")
				expect(hole.value).to eq "Blue"
			end
		end
	end
end