class ScaleNote
  attr_accessor :scale, :scale_number, :note_id, :mode_letter
  
  def initialize(options)
    @scale = options[:scale]
    @scale_number = options[:scale_number]
    @note_id = options[:note_id]
  end
  
  def description
    "#{note.name}, #{scale_number}"
  end
  
  def name
    note.name
  end
  
  def note
    Note.find(@note_id)
  end
  
  def next_note
    #Scale notes are kept in an array where the index starts at 0. Scale notes are ordered, with the starting note as position 1
    #To get the next note, decrement the scale number to basically convert it to an array index, then add 1 to get the next index
    #In this case it -1 + 1 = 0, which is why the scale number is just used as the index.
    #For getting the previous note, it -1 -1 = -2, which is why i'm using -2 with the scale number
    scale.scale_notes[cycle(scale_number)]
  end
  
  def previous_note
    scale.scale_notes[cycle(scale_number-2)]
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
end
