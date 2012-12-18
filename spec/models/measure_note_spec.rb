require 'spec_helper'

describe MeasureNote do
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
  		#@song = Song.new
  		@song = Song.create({:note_id=>Note.find_by_name("C")})
  		@measure = @song.get_measure
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
    	
    	it "should clear the note from the measure" do
        @measure.notes_by_position["1.0"].size.should == 1
        @measure.notes_by_position["1.0"].first.note.name.should == "C"

        @measure.clear(:measure_note=>@measure.notes_by_position["1.0"].first)
        @measure.notes_by_position.should be_empty
    	end
    	
    	it "should invert the octave of the note" do
    	  measure_note = @measure.measure_notes.first
    	  measure_note.octave_number.should == 4
    	  measure_note.invert("up")
    	  measure_note.octave_number.should == 5
    	  measure_note.invert("down")
    	  measure_note.octave_number.should == 4
    	end
  	end
  	
	end
end
