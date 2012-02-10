class Song < ActiveRecord::Base
  has_many :measures
  before_create :set_default_values
  
  def add_to_song(note)
    meausure = get_measure
    measure.add_to_measure(note)
  end

  def edit_measure_note(measure_note)
    
  end
  
  def get_measure
    measure = measures.last
    if self.measure.beats_left == 0
      new_measure = Measure.new({:order=>measures.size+1})
      self.measures << new_measure
      new_measure
    end
  end
  
  private
  def set_default_values
    self.tempo ||= "Moderate"
    self.time_signature ||= "4/4"
  end
end
