class MeasureNote < ActiveRecord::Base
	belongs_to :note_type
	belongs_to :measure
	before_create :set_default_values
	
	def set_default_values
		self.octave_number ||= 4
	end
end
