require 'spec_helper'

describe Position do
  before(:each) do
    @song = FactoryGirl.build(:song)
    @measure = FactoryGirl.build(:measure, :song=>@song)
    measure_note_C = FactoryGirl.build(:measure_note, :measure=>@measure, :note_id => 1) #C
    measure_note_E = FactoryGirl.build(:measure_note, :measure=>@measure, :note_id => 5) #E
    measure_note_G = FactoryGirl.build(:measure_note, :measure=>@measure, :note_id => 8) #G
    @measure_notes = [measure_note_C, measure_note_E, measure_note_G]
    
    #@measure_notes = @measure.measure_notes
  end
  
  it "should be valid when initialized with a song, measure, and position id" do
    position = Position.new(:song=>@song, :measure=>@measure, :position=>1)
    position.valid?.should be_true
  end
  
  it "should return nil if song, measure, and position attributes haven't been set" do
      Position.new.valid?.should_not be_true
      Position.new(:song=>@song).valid?.should_not be_true
      Position.new(:measure=>@measure).valid?.should_not be_true
      Position.new(:position=>1).valid?.should_not be_true
      Position.new(:song=>@song, :measure=>@measure).valid?.should_not be_true
      Position.new(:song=>@song, :position=>1).valid?.should_not be_true
      Position.new(:measure=>@measure, :position=>1).valid?.should_not be_true
    end

  it "should return measure notes (C, E, and G) for a given song, measure, and position" do
    MeasureNote.stub(:where).and_return(@measure_notes)
    
    position = Position.new(:song=>@song, :measure=>@measure, :position=>1)
    position.notes.class.should == Array
    position.notes.size.should == 3
    position.notes.each{|n| n.class.should == MeasureNote}
  end
  
  it "should return a chord for notes in a position" do
    MeasureNote.stub(:where).and_return(@measure_notes)
    
    position = Position.new(:song=>@song, :measure=>@measure, :position=>1)
    chord = position.chord
    chord.class.should == Chord
    chord.notes.each{|c| c.class.should == MeasureNote}
    
  end
  
end