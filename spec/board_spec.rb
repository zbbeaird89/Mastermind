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

		context "#get_hole" do 
			it "returns the hole specified" do
				example = ["R", "B", "G", "Y"] 
				board = Board.new({row: example})
				expect(board.get_hole(1)).to eq "R"
			end
		end

		context "#set_hole" do 
			it "updates the specified hole with a new value" do 
				Dog = Struct.new(:value)
				example = [Dog.new("R"), "B", "G", "Y"]
				board = Board.new({row: example})
				board.set_hole(1, "O")
				expect(board.get_hole(1).value).to eq "O"
			end
		end

		context "#row" do 
			it "returns row" do 
				board = Board.new({row: "hello"})
				expect(board.row).to eq "hello"
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

	end
end