require 'spec_helper'

describe Song do
	before(:each) do
		@song = Song.new
	end
	
	it "should return a measure" do
		@song.get_measure.class.should == Measure
	end
	
	it "should add a note to a song and return a measure with a C quarter note measure note" do
		@song.add_to_song(:note=>"C")
		@song.measures.should_not be_empty
		@song.measures.size.should == 1
		
		song_measure = @song.measures.first
		song_measure.measure_notes.should_not be_empty
		song_measure.measure_notes.size.should == 1
		
		measure_note = song_measure.measure_notes.first
		measure_note.note.should == "C"		
	end
	
end
