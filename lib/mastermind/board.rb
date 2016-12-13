module Mastermind
	class Board 
		attr_reader :row

		def initialize(input = {})
			@row = input.fetch(:row, default_row)
		end

		def get_hole(hole) 
			@row[hole - 1]
		end

		def set_hole(hole, value)
			get_hole(hole).value = value
		end


		private

		def default_row
			Array.new(4) { Hole.new }
		end
	end
end