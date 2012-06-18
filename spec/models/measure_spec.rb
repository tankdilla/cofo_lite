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
      @c_chord = Chord.create_chord({:base_note=>chord_note, :chord_letter=>chord_symbol.name})
      
      chord_note_2 = "G"
      chord_number_2 = 1
      chord_symbol_2 = ChordSymbol.find(chord_number_2.to_i)
      @g_chord = Chord.create_chord({:base_note=>chord_note_2, :chord_letter=>chord_symbol_2.name})
      
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
    	
    	it "should return positions array with one element" do
    	  @measure.positions.should == ["1.0"]
    	end
    	
    	it "should return positions array with 4 elements" do
    	  3.times {@measure.add_to_measure(:note=>@note)}
    	  
    	  @measure.positions.should == ["1.0","2.0","3.0","4.0"]
    	end
    	
    	it "notes by position should return a hash with a key of 1 and value of 1" do
    	  notes_by_position = @measure.notes_by_position
    	  
    	  notes_by_position.class.should == Hash
    	  notes_by_position.has_key?("1.0").should be_true
    	  notes_by_position["1.0"].class.should == Array
    	  notes_by_position["1.0"].size.should == 1
    	  notes_by_position["1.0"].first.class.should == MeasureNote
    	end
    	
    end
    
    context "add a chord to a measure" do
      before(:each) do
  	    @measure.add_to_measure(:chord=>@c_chord)
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
    	  3.times {@measure.add_to_measure(:chord=>@c_chord)}
    	  
    	  @measure.get_next_position.should == -1
    	end
    	
    	it "should return positions array with one element = [1]" do
    	  @measure.positions.should == ["1.0"]
    	end
    	
    	it "should return positions array with 4 elements = [1,2,3,4]" do
    	  @measure.add_to_measure(:chord=>@c_chord)
    	  
    	  @measure.positions.should == ["1.0","2.0"]
    	end
    	
    	it "should return positions array with 4 elements = [1,2,3,4]" do
    	  3.times {@measure.add_to_measure(:chord=>@c_chord)}
    	  
    	  @measure.positions.should == ["1.0","2.0","3.0","4.0"]
    	end
    	
    	it "notes by position should return a hash with a key of 1 and value of 1" do
    	  3.times {@measure.add_to_measure(:chord=>@c_chord)}
    	  notes_by_position = @measure.notes_by_position
    	  
    	  notes_by_position.has_key?("1.0").should be_true
    	  notes_by_position["1.0"].class.should == Array
    	  notes_by_position["1.0"].size.should == 4
    	  
    	  notes_by_position.has_key?("4.0").should be_true
    	  notes_by_position["4.0"].class.should == Array
    	  notes_by_position["4.0"].size.should == 4    	  
    	end
    end
    
    context "add G chord" do
      before(:each) do
  	    @measure.add_to_measure(:chord=>@g_chord)
  	  end
  	  
  	  it "the notes should be in order" do
  	    @measure.positions.each do |p|
  	      @measure.notes_by_position[p][0].note.name.should == "G"
  	      @measure.notes_by_position[p][1].note.name.should == "B"
  	      @measure.notes_by_position[p][2].note.name.should == "D"
  	      @measure.notes_by_position[p][3].note.name.should == "Gb"
  	    end
  	  end
    end
    
  end
end
