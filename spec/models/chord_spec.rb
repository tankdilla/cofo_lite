require 'spec_helper'

describe Chord do
  it 'should create a C major chord with the notes C, E, and G' do
    chord = Chord.create_chord({:base_note => "C", :chord_name => "major"})
    chord.notes[0].name.should == "C"
    chord.notes[1].name.should == "E"
    chord.notes[2].name.should == "G"
  end
  
  it 'should show the notes for the chord' do
    chord = Chord.create_chord({:base_note => "C", :chord_name => "major"})
    chord.show_notes.should == ["C","E", "G"]
  end
  
  it 'should have a description of C major' do
    chord = Chord.create_chord({:base_note => "C", :chord_name => "major"})
    chord.chord_name.should == "C major"
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
