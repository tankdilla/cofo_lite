class MeasureNote < ActiveRecord::Base
	belongs_to :note_type
	belongs_to :measure
	belongs_to :note
	
	before_create :set_default_values
	
	def set_default_values
		self.octave_number ||= 4
	end
	
	def name
	  note.name
	end
end
