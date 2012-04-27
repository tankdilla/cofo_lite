require 'spec_helper'

describe Song do
	before(:each) do
		@song = Song.new
	end
	
	it "should return a measure" do
		@song.get_measure.class.should == Measure
	end
	
	it "should add a note to a song and return a measure with a C quarter note measure note" do
		@song.add_to_song(:note=>Note.find_by_name("C"))
		@song.measures.should_not be_empty
		@song.measures.size.should == 1
		
		song_measure = @song.measures.first
		song_measure.measure_notes.should_not be_empty
		song_measure.measure_notes.size.should == 1
		
		measure_note = song_measure.measure_notes.first
		measure_note.note.should_not be_nil
		measure_note.note.name.should == "C"		
	end
	
	describe "Chords for song melody" do
	  it "should return a C major chord and F major chord given a melody note of C" do
	    
	  end
	end
	
end
