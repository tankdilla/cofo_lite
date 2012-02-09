class Scale
  attr_accessor :key_note, :mode, :scale_notes
  
  def initialize
    @scale_notes = Array.new
  end
  
  def get_note(options)
    if !options[:scale_number].nil?
      
      #having to do this dance with the number because the scale index starts at 0, but i want to keep the scale numbering as 1-7
      scale_note = @scale_notes[cycle(options[:scale_number]-1)]
      
      if options[:modifier] 
        if options[:modifier] == "b"
          scale_note.note.flat
        elsif options[:modifier] == "#"
          scale_note.note.sharp
        end
      else
        scale_note.note
      end
    else
      nil
    end
      
  end
  
  def cycle(order)
    if order > 6
      order = order - 7
    end
    
    if order < 0
      order = order + 7
    end
    
    order
  end
  
  class << self
    def create_scale(key, mode_string="I")
      mode_string = resolve_mode(mode_string)
      
      key_note = Note.find_by_name(key)
      mode = Mode.find_by_letter(mode_string)
      
      scale = Scale.new
      scale.key_note = key
      scale.mode = mode_string
      
      n = 1
      note = key_note
      mode.mode_intervals.each do |i|
        scale.scale_notes << ScaleNote.new(:note_id => note.id, :scale_number=>n, :scale=>scale, :mode_letter => mode.letter)
        note = note.next_note(i)
        n += 1
      end
      scale
    end
    
    def resolve_mode(mode_string)
      case mode_string
        when "major", "1"
          "I"
        when "minor", "2"
          "II"
        when "dominant", "5"
          "V"
        when "3"
          "III"
        when "4"
          "IV"
        when "6"
          "VI"
        when "7"
          "VII"
        else
          mode_string
      end
    end
  end
end
