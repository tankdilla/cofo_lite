class Song < ActiveRecord::Base
  belongs_to :note
  has_many :measures, :dependent=>:destroy
  before_create :set_default_values
  
  def add_to_song(options)
    if options[:measure]
      measure = Measure.where(id: options[:measure])
    else
      measure = get_measure
    end
    
    measure.add_to_measure(options)
    measure
  end
  
  def add_chord(options)
    if options[:chord_string]
      chord_params = options[:chord_string].split(',')
      chord_note = chord_params[0]
      chord_number = chord_params[1]
      chord_symbol = ChordSymbol.find(chord_number.to_i)
      chord = Chord.create_chord({:base_note=>chord_note, :chord_letter=>chord_symbol.name})
    elsif options[:name] && options[:note]
      chord_note = options[:note]
      chord_name = options[:name]
      chord = Chord.create_chord({:base_note=>chord_note, :chord_name=>chord_name})
    end
      
    add_to_song(:chord=>chord)
  end
  
  def add_progression(options)
    progression = Progression.find(options[:progression])
    scale = Scale.create_scale(options[:song_key])
    progression_chords = progression.chords(scale)
    progression_chords.each do |progression_chord|
      add_to_song(:chord => progression_chord)
    end
  end

  def edit_measure_note(measure_note)
    
  end
  
  def get_measure
  	if self.measures.empty?
  		measure = Measure.new(:order=>1)
  		self.measures << measure
  	else
  	
		  last_measure = self.measures.last
		  if last_measure.beats_left == 0
		    measure = Measure.new({:order=>measures.size+1})
		    self.measures << measure
		  else
		  	measure = last_measure
		  end
		end
		
		measure
  end
  
  def play
    output = UniMIDI::Output.use(:first)

    midi = MIDI::IO.new(output)
      
    self.measures.each do |measure|
      measure.positions.each do |pos|
        notes = measure.notes_by_position[pos].collect{|n| "#{n.note.name}#{n.octave_number}"}
        
        midi.play(notes, 0.5)
      end
    end
    
  end
  
  private
  def set_default_values
    self.tempo ||= "Moderate"
    self.time_signature ||= "4/4"
  end
end
