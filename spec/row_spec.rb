require "spec_helper"

module Mastermind
	describe Row do 
		context "#initialize" do 
			it "passes when given correct arguments" do 
				answer = ["B", "R", "G", "Y"]
				hint = ["Bl", "W", "_", "_"] 
				expect { Row.new(answer, hint) }.to_not raise_error
			end

			it ":answer has 4 things" do 
				answer = ["B", "R", "G", "Y"]
				hint = ["Bl", "W", "_", "_"]
				row = Row.new(answer, hint)
				expect(row.answer.length).to eq 4
			end

			it ":hint has 4 things" do 
				answer = ["B", "R", "G", "Y"]
				hint = ["Bl", "W", "_", "_"]
				row = Row.new(answer, hint)
				expect(row.hint.length).to eq 4
			end

			it ":answer stores correct values" do 
				answer = ["B", "R", "G", "Y"]
				hint = ["Bl", "W", "_", "_"]
				row = Row.new(answer, hint)
				row.answer.each_with_index do |cell, i|
					expect(cell.value).to eq answer[i]
				end
			end

			it ":hint stores correct values" do 
				answer = ["B", "R", "G", "Y"]
				hint = ["Bl", "W", "_", "_"]
				row = Row.new(answer, hint)
				row.hint.each_with_index do |cell, i|
					expect(cell.value).to eq hint[i]
				end
			end
		end
=begin
		context "#get_cell" do 
			it "returns specified 'answer' cell" do 
				row = Row.new
				answer = row.answer
				answer[0].value = "B"
				expect(row.get_cell(answer, 0).value).to eq "B"
			end

			it "returns specified 'hint' cell" do 
				row = Row.new
				hint = row.hint
				hint[0].value = "Bl"
				expect(row.get_cell(hint, 0).value).to eq "Bl"
			end
		end

		context "#set_cell" do 
			it "sets specified 'answer' cell and value" do 
				row = Row.new
				answer = row.answer
				row.set_cell(answer, 0, "B")
				expect(row.get_cell(answer, 0).value).to eq "B"
			end
		end
=end
	end
end