module Mastermind
	class Board
		attr_reader :row

		def initialize(input = {})
			@row = input.fetch(:row, default_row)
		end

		# get_cell chooses either the answer cells and a position
		# or the hint cells and a position.
		# :answer    :hint
		# _ _ _ _   _ _ _ _

		def get_cell(key, position)
			@row[key][position - 1].value
		end

		private

		def default_row
			Hash[answer: empty_cells, hint: empty_cells]
		end

		def empty_cells
			Array.new(4) { Cell.new }
		end
	end
end