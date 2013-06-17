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
    chord = Chord.formatted_chord(options)
      
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

  def scale
    @scale ||= Scale.create_scale(note.name, "all")
  end

  def scale_notes
    scale.scale_notes.collect(&:name)
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
        # debugger
        if notes.first == "rest4"
          sleep(0.5)
          next
        end
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
