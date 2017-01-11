class Array
	def arrange
		array = []
		self.each do |cell|
			if cell.value.match("_")
				array.push(cell)
			elsif cell.value.match("\w+")
				array.unshift(cell)
			end
		end
	end
end