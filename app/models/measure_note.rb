class MeasureNote < ActiveRecord::Base
	belongs_to :note_type
	belongs_to :measure
	belongs_to :note

	before_create :set_default_values

	def set_default_values
		self.octave_number ||= 4
	end

	def name
    unless note.name == 'rest'
      note.name + octave_number.to_s
    else
      note.name
    end
	end

  def note_name
    note.name
  end

	def invert(direction)
	  if direction == "up"
	    self.octave_number += 1
    elsif direction == "down"
	    self.octave_number -= 1
    end
	end
end
