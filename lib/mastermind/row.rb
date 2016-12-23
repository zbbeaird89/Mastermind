module Mastermind
	class Row
		attr_reader :answer, :hint

		def initialize(input = {})
			@answer = input.fetch(:answer, default_cells)
			@hint = input.fetch(:hint, default_cells)
		end
		
		# get_cell chooses either the answer cells and a position
		# or the hint cells and a position.
		# :answer    :hint
		# _ _ _ _   _ _ _ _

		def get_cell(cells, position)
			cells[position - 1]
		end

		def set_cell(cells, position, value)
			get_cell(cells, position).value = value
		end


		private

		def default_cells
			Array.new(4) { Cell.new }
		end

	end
end