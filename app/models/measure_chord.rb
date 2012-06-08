class MeasureChord
  attr_reader :chord_array, :root_note
  def initialize(chord_array, attributes)
    #Assumption when creating a measure chord is that the first note is the root note, 
    #  which determines the name of the chord, and how it can be modified
    @chord_array = chord_array
    @root_note = chord_array[0]
  end
end