require 'spec_helper'

describe Chord do
  context "create chord method" do
    it 'should create a C major chord with the notes C, E, and G' do
      chord = Chord.create_chord({:base_note => "C", :chord_name => "major"})
      chord.notes[0].name.should == "C"
      chord.notes[1].name.should == "E"
      chord.notes[2].name.should == "G"
    end
    
    it 'should show the notes for the chord' do
      chord = Chord.create_chord({:base_note => "C", :chord_name => "major"})
      chord.show_notes.should == ["C","E","G"]
    end
    
    it 'should have a description of C major' do
      chord = Chord.create_chord({:base_note => "C", :chord_name => "major"})
      chord.description.should == "Cmaj"
    end
    
    it 'should create a F minor chord with the notes F, Ab, and C' do
      chord = Chord.create_chord({:base_note => "F", :chord_name => "minor"})
      chord.notes[0].name.should == "F"
      chord.notes[1].name.should == "Ab"
      chord.notes[2].name.should == "C"
    end
    
    it 'should create a G III chord with the notes G, Bb, D, and F' do
      chord = Chord.create_chord({:base_note => "G", :chord_letter => "III"})
      chord.notes[0].name.should == "G"
      chord.notes[1].name.should == "Bb"
      chord.notes[2].name.should == "D"
      chord.notes[3].name.should == "F"
    end
    
    it 'should create a Gb dominant 7 chord with the notes Gb, Bb, Db and E' do
      chord = Chord.create_chord({:base_note => "Gb", :chord_name => "dominant 7"})
      chord.notes[0].name.should == "Gb"
      chord.notes[1].name.should == "Bb"
      chord.notes[2].name.should == "Db"
      chord.notes[3].name.should == "E"
    end
  end
  
  context "formatted chord method" do
    it "should return a chord object" do
      chord = Chord.formatted_chord(:chord_string=>"C,1")
      chord.class.should == Chord
      %w{C E G B}.each_with_index{|i, j| chord.notes[j].name.should == i}
      
      chord = Chord.formatted_chord(:chord_note=>"D", :chord_name=>"minor 7")
      chord.class.should == Chord
      %w{D F A C}.each_with_index{|i, j| chord.notes[j].name.should == i}
    end
  end
  
  context "chord with melody note" do
    it "should create a chord that includes the melody note" do
      chord = Chord.create_chord(:base_note => "C", :chord_name => "major", :melody_note=>"A")
      chord.notes[0].name.should == "C"
      chord.notes[1].name.should == "E"
      chord.notes[2].name.should == "G"
      chord.notes[3].name.should == "A"
    end
    
    it "should create a chord that includes the melody note, excluding the 5th" do
      chord = Chord.create_chord(:base_note => "C", :chord_name => "major", :melody_note=>"A", :exclude_fifth=>true)
      chord.notes[0].name.should == "C"
      chord.notes[1].name.should == "E"
      chord.notes[2].name.should == "A"
    end
    
    it "should create a chord that includes the melody note last, if it's already a note in the chord" do
      chord = Chord.create_chord(:base_note => "C", :chord_name => "dominant 7", :melody_note=>"E", :exclude_fifth=>true)
      chord.notes[0].name.should == "C"
      chord.notes[1].name.should == "Bb"
      chord.notes[2].name.should == "E"
    end
  end
  
  context "chord suggestions given melody note and song key" do
    it "should suggest C major, D minor F major, and A minor given melody note C and the key of C" do
      chords = Chord.possible_chords(:melody_note=>"C", :scale_key=>"C")
      chords.size.should == 4
      chords[0].show_notes.should == %w{C E G B}
      chords[1].show_notes.should == %w{D F A C}
      chords[2].show_notes.should == %w{F A C E}
      chords[3].show_notes.should == %w{A C E G}
    end
  end
  
  context "suggest chords based on notes given" do
    it "should suggest an Fmaj given the notes F A C E" do
      notes = %w{F A C E}
      possible_chords = Chord.name_by_notes(notes)
      possible_chords.size.should == 1
      possible_chords[0].description.should == "Fmaj7"
    end

  end
end
