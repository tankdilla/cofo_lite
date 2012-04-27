class Position
  attr_reader :song, :measure, :position, :notes
  
  def initialize(attributes={})
    @song = attributes[:song]
    @measure = attributes[:measure]
    @position = attributes[:position]
    @notes = MeasureNote.where(:song_id=>song.id, :measure_id=>measure.id, :position=>position) if valid?
  end
  
  def valid?
    !@song.nil? && !@measure.nil? && !@position.nil?
  end
      
  def chord
    Chord.new(:notes=>notes)
  end
end