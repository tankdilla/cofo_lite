require 'spec_helper'

describe Measure do
	it "should initialize a measure with 4 beats by default" do
		m = Measure.new
		m.beats_per_measure.should == 4
	end
	
  context "New song, with one measure" do
    before(:all) do
      @note = Note.find_by_name("C")
      
      chord_note = "C"
      chord_number = 1
      chord_symbol = ChordSymbol.find(chord_number.to_i)
      @chord = Chord.create_chord({:base_note=>chord_note, :chord_letter=>chord_symbol.name})
    end
    
  	before(:each) do
  		@song = Song.new
  		@measure = @song.get_measure
  	end
  	
  	it "should have an order of 1" do
  		@measure.order.should == 1
  	end
  	
  	it "should have beats left = 4" do
  	  @measure.beats_left.should == 4
  	end
  	
  	it "should return a next position of 1" do
			@measure.get_next_position.should == 1
		end
		
		it "should have no measure notes" do
		  @measure.measure_notes.size.should == 0
		end
  	
  	context "add a note to a measure" do
  	  before(:each) do
  	    @measure.add_to_measure(:note=>@note)
  	  end
      
    	it "should add one note to a measure and return a measure note" do
    	  @measure.measure_notes.size.should == 1
    		@measure.measure_notes.first.should_not be_nil
    		@measure.measure_notes.first.class.should == MeasureNote
        
        @measure.measure_notes.first.note.should_not be_nil
    		@measure.measure_notes.first.note.name.should == "C"
		  end
		
		  it "should return a quarter note by default" do
    		@measure.measure_notes.first.note_type_id.should_not be_nil
    		@measure.measure_notes.first.note_type.name.should == "quarter"  		  		
    	end
    	
    	it "should return a next position of 2 after adding a note to a song" do
    	  @measure.get_next_position.should == 2
    	end
    	
    	it "should return beats left = 3 after adding a note to a measure" do
    	  @measure.beats_left.should == 3
    	end
    	
    	it "should return beats left = 0, next position = -1 after 4 quarter notes have been added to a measure" do
    	  3.times {@measure.add_to_measure(:note=>@note)}
    	  
    	  @measure.get_next_position.should == -1
    	end
    end
    
    context "add a chord to a measure" do
      before(:each) do
  	    @measure.add_to_measure(:chord=>@chord)
  	  end
      
    	it "should add four notes to a measure and return four measure notes" do
    	  @measure.measure_notes.size.should == 4
    		@measure.measure_notes.each{|note| note.class.should == MeasureNote}
        
    		@measure.measure_notes[0].note.name.should == "C"
    		@measure.measure_notes[1].note.name.should == "E"
    		@measure.measure_notes[2].note.name.should == "G"
    		@measure.measure_notes[3].note.name.should == "B"
		  end
		  
		  it "each note of the chord should have position of 1" do
		    @measure.measure_notes.each{|note| note.position.should == 1}
		  end
		  
    	it "should return a next position of 2 after adding a note to a song" do
    	  @measure.get_next_position.should == 2
    	end
    	
    	it "should return beats left = 3 after adding a note to a measure" do
    	  @measure.beats_left.should == 3
    	end
    	
    	it "should return beats left = 0, next position = -1 after 4 quarter notes have been added to a measure" do
    	  3.times {@measure.add_to_measure(:chord=>@chord)}
    	  
    	  @measure.get_next_position.should == -1
    	end
    end
  end
end
