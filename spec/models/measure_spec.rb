require 'spec_helper'

describe Measure do
	it "should initialize a measure with 4 beats by default" do
		m = Measure.new
		m.beats_per_measure.should == 4
	end
	
	context	"get next position method" do
		before(:each) do
			@measure = Measure.new
		end
				
		it "should return a next position of 1" do
			next_position = @measure.get_next_position
			next_position.should == 1
		end
		
		it "should return a next position of 2.5 after adding 1.5 beats to the measure" do
			next_position = @measure.get_next_position(1)
			next_position = @measure.get_next_position(0.5)
			@measure.beats_left.should == 2.5
		end
		
		it "should return a next positon of -1 after all beats of a measure have been added" do
			4.times{ @measure.get_next_position}
			@measure.get_next_position.should == -1
		end
	end
	
  context "Add a note to a measure, creating a measure note" do
  	before(:each) do
  		@song = Song.new
  		@measure = @song.get_measure
  	end
  	
  	it "should have an order of 1" do
  		@measure.order.should == 1
  	end
  	
  	it "should add a note to a measure and return a measure note" do
  		@measure.add_to_measure(:note=>"C")
  		@measure.measure_notes.first.should_not be_nil
  		@measure.measure_notes.first.class.should == MeasureNote

  		@measure.measure_notes.first.note.should == "C"
		end
		
		it "should return a quarter note by default" do
			@measure.add_to_measure(:note=>"C")
  		@measure.measure_notes.first.note_type_id.should_not be_nil
  		@measure.measure_notes.first.note_type.name.should == "quarter"  		  		
  	end
  end
end
