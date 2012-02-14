class MeasureNote < ActiveRecord::Base
	before_create :set_default_values
	
	def set_default_values
		self.octave_number ||= 4
	end
end
