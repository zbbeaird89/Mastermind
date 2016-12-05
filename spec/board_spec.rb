require "spec_helper"

module Mastermind
	describe Board do 
		context "#initialize" do 
			it "passes when given row key and value" do  
				expect { Board.new({row: "row"}) }.to_not raise_error
			end

			it "passes when given no arguments" do 
				expect { Board.new }.to_not raise_error
			end
		end

		context "#default_row" do 
			it "calls default_row by default" do 
				board = Board.new
				board.row.each do |hole|
					expect(hole.value).to eq ""
				end
			end
		end

		context "#row" do 
			it "returns row" do 
				board = Board.new({row: "hello"})
				expect(board.row).to eq "hello"
			end
		end
	end
end