class MeasureNote < ActiveRecord::Base
	belongs_to :note_type
	belongs_to :measure
	belongs_to :note
	
	before_create :set_default_values
	
	def set_default_values
		self.octave_number ||= 4
	end
	
	def name
	  note.name + octave_number.to_s
	end
	
	def invert(options)
	  if options[:invert] && options[:invert].is_a?(Fixnum)
	    self.octave_number += options[:invert]
    end
	end
end
