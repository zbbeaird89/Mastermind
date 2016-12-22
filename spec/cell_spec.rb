require "spec_helper"

module Mastermind
	describe Cell do 
		context "#initialize" do 
			it "creates a '_' by default" do 
				cell = Cell.new
				expect(cell.value).to eq "_"
			end 

			it "excepts 'B' as a value" do 
				cell = Cell.new("B")
				expect(cell.value).to eq "B"
			end
		end
	end
end