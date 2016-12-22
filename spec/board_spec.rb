require "spec_helper"

module Mastermind
	describe Board do 
		context "#initialize" do 
			it "excepts a custom row" do 
				board = Board.new(row: "row")
				expect { Board.new }.to_not raise_error
			end

			it "creates 4 answer spaces by default" do 
				board = Board.new
				expect(board.row[:answer].length).to eq 4
			end

			it "creates 4 hint spaces by default" do 
				board = Board.new
				expect(board.row[:hint].length).to eq 4
			end

			it "sets each answer space to '_'" do 
				board = Board.new
				board.row[:answer].each do |cell|
					expect(cell.value).to eq "_"
				end
			end

			it "sets each hint space to '_'" do 
				board = Board.new
				board.row[:hint].each do |cell|
					expect(cell.value).to eq "_"
				end
			end
		end

		context "#get_cell" do 
			it "returns specified 'answer' cell" do 
				board = Board.new
				board.row[:answer][1].value = "B"
				expect(board.get_cell(:answer, 2)).to eq "B"
			end
		end
	end
end