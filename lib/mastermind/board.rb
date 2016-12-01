module Mastermind
	class Board 
		def initialize(input = {})
			@row = input.fetch(:row, default_row)
		end


		private

		def default_row
			Array.new(4) { Hole.new }
		end
	end
end