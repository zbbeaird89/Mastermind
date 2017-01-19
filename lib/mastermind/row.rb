module Mastermind
	class Row
		attr_reader :answer, :hint

		def initialize(answer, hint)
			convert = Proc.new { |cell| cell = Cell.new(cell) }
			@answer = answer.collect(&convert)
			@hint = hint.collect(&convert)
		end
	end
end