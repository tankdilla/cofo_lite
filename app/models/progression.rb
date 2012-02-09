class Progression < ActiveRecord::Base
  has_many :progression_steps
  
  def chords(scale)
    #chord number array should just be an array of chord numbers (or string character)
    chord_array = Array.new
    
    self.progression_steps.each do |step|
      chord_array << Chord.create_chord({
        :base_note => scale.get_note(:scale_number=>step.chord_symbol_id).name, 
        :chord_letter => step.chord_symbol.name})
    end
    
    chord_array
  end
end
