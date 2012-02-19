class Measure < ActiveRecord::Base
  belongs_to :song
  has_many :measure_notes
  after_initialize :set_measure
  
  @@default_octave_number = 4
  cattr_accessor :default_octave_number
  
  #attr_reader :beats_left
  
  def beats_per_measure
  	if song
  		song.time_signature.split("/").first.to_i
  	else
  		4
  	end
    
  end
  
  def add_to_measure(options)
    if options[:note]
      note = options[:note]
      if note.is_a?(String)
        #set measure note with default values
        measure_note = MeasureNote.new(
          :note=>note, 
          :octave_number => Measure.default_octave_number, 
          :note_type_id => NoteType.find_by_name("quarter").id, 
          :position => get_next_position(1))
        
      elsif note.is_a?(Hash)
        measure_note = MeasureNote.new({:note=>note[:name]})
      end
      
      self.measure_notes << measure_note
    elsif options[:chord]
      debugger
      measure_notes = Array.new
      
      next_position = get_next_position(1)
      note_type = NoteType.find_by_name("quarter").id
      debugger
      #ensure that all chord notes get created with the same attributes in MeasureNote
      options[:chord].notes.each do |note|
        self.measure_notes << MeasureNote.new(
          :note=>note.name, 
          :octave_number => Measure.default_octave_number, 
          :note_type_id => note_type, 
          :position => next_position)
      end
      
    end
    
  end
  
  def get_next_position(count_of_note_added=1)
  	return -1 if beats_left == 0
    pos = beats_per_measure - @beats_left + count_of_note_added
    @beats_left -= count_of_note_added
    pos
  end
  
  def beats_left
    @beats_left = beats_per_measure - self.measure_notes.collect{|x| x.note_type.count.to_f}.sum
  end
  
  private
  
  def set_measure
    @beats_left = self.beats_per_measure
  end
end
