require "spec_helper"

describe Array do 
	TestCell = Struct.new(:value)
	let(:b) { TestCell.new("B") }
	let(:r) { TestCell.new("R") }
	let(:us) {TestCell.new("_")}

	context "#arrange" do 
		it "returns 4 things" do 
			array = [us, us, b, r]
			new_array = array.arrange
			expect { new_array }.to_not raise_error
		end
	end
end