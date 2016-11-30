module Mastermind
	class Player
		attr_reader :name, :side
		def initialize(input = {})
			@name = input.fetch(:name)
			@side = input.fetch(:side)
		end
	end
end	