class Song < ActiveRecord::Base
  belongs_to :note
  has_many :measures, :dependent=>:destroy
  before_create :set_default_values
  
  def add_to_song(options)
    measure = get_measure
    measure.add_to_measure(options)
    measure
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
  
  private
  def set_default_values
    self.tempo ||= "Moderate"
    self.time_signature ||= "4/4"
  end
end
