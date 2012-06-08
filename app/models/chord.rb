class Chord < ActiveRecord::Base
  has_many :chord_definitions
  
  attr_accessor :chord_name, :notes, :root_note
  
  def show_notes
    @notes.collect{|n| n.name}
  end
  
  def invert(inversion_number)
    #inversion number should be 0, 1, 2, or 3
    self.notes.rotate(inversion_number)
  end
  
  def add_7th(modifier)
    
  end
  
  def add_9th(modifier)
    
  end
  
  def add_11th(modifier)
    
  end
  
  def add_13th(modifier)
    
  end
  
  def add_notes(chord_array)
    @notes = chord_array
    @root_note = chord_array[0]
  end
  
  def get_chord_notes
    self.chord_definitions.each do |d|
      chord_array << scale.get_note({:scale_number => d.scale_number, :modifier => d.modifier})
    end
    
    chord.notes = chord_array
  end
  
  class << self
    def create_chord(chord_options)
      
      if chord_options[:base_note]
        
        base_note = chord_options[:base_note]
        
        if chord_options[:chord_name]
          #if a chord name, ie major, minor, diminished is specified, find the notes based on the chord table
          #else, use the 1, 3, 5, and 7 notes based on the chord letter specified
          
          chord_type = chord_options[:chord_name]
          
          chord = Chord.find_by_name(chord_type)
          chord.chord_name = "#{base_note} #{chord_type}"
          
          scale = Scale.create_scale(base_note)
          chord_array = Array.new
          
          if chord
            chord.chord_definitions.each do |d|
              chord_array << scale.get_note({:scale_number => d.scale_number, :modifier => d.modifier})
            end
            
            chord.notes = chord_array
          else
            nil
          end
          
        elsif chord_options[:chord_letter]
          scale = Scale.create_scale(base_note, chord_options[:chord_letter])
          chord = Chord.new
          chord.chord_name = "#{base_note} #{chord_options[:chord_letter]}"
          chord_array = Array.new
          
          #For now, if the chord letter is passed in, it will just use a simple 1,3,5,7 for whichever mode it's in
          #In the future, i'll implement a chord suggestion function for each chord letter I-VII
          [1, 3, 5, 7].each do |d|
            chord_array << scale.get_note({:scale_number => d})
          end
          
          chord.notes = chord_array
        end
      else
        chord = nil
      end
      
      chord
    end
  end
end
