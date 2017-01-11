module Mastermind
	class Row
		attr_reader :answer, :hint

		def initialize(answer, hint)
			convert = Proc.new { |cell| cell = Cell.new(cell) }
			@answer = answer.collect(&convert)
			@hint = hint.collect(&convert)
		end
		
		# get_cell chooses either the answer cells and a position
		# or the hint cells and a position.
		# :answer    :hint
		# _ _ _ _   _ _ _ _

		def get_cell(cells, position)
			cells[position]
		end

		def set_cell(cells, position, value)
			get_cell(cells, position).value = value
		end
	end
end