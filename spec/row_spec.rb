require "spec_helper"

module Mastermind
	describe Row do 
		context "#initialize" do 
			it "creates 4 answer spaces by default" do 
				row = Row.new
				expect(row.answer.length).to eq 4
			end

			it "creates 4 hint spaces by default" do 
				row = Row.new
				expect(row.hint.length).to eq 4
			end

			it "sets each answer space to '_'" do 
				row = Row.new
				row.answer.each do |cell|
					expect(cell.value).to eq "_"
				end
			end

			it "sets each hint space to '_'" do 
				row = Row.new
				row.hint.each do |cell|
					expect(cell.value).to eq "_"
				end
			end
		end

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

	end
end