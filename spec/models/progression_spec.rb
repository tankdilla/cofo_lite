require 'spec_helper'

describe Progression do
  describe 'testing a 2-5-1 progression of chords in the key of C' do
    before(:each) do
      @scale = Scale.create_scale("C")
      @progression = Progression.first #first defined prgrogression is 2-5-1
    end
  
    it 'should have 2-5-1 as the name for the progression' do
      @progression.name.should == '2-5-1'
    end
    
    it 'should have 3 progression steps' do
      @progression.progression_steps.size.should == 3
    end
    
    it 'progression steps should have chord symbols of "II", "V", and "1" in order ' do
      @progression.progression_steps[0].chord_symbol.name.should == "II"
      @progression.progression_steps[1].chord_symbol.name.should == "V"
      @progression.progression_steps[2].chord_symbol.name.should == "I"
    end
    
    it 'should return 3 chords as the chords of the progression' do
      @progression.chords(@scale).size.should == 3
    end
    
    it 'should have a D-F-A-C chord as the first chord in the progression' do
      @progression.chords(@scale).first.show_notes.should == ["D", "F", "A", "C"]
    end
    
    it 'should have a G-B-D-F chord as the second chord in the progression' do
      @progression.chords(@scale).second.show_notes.should == ["G", "B", "D", "F"]
    end
    
    it 'should have a C-E-G-B chord as the last chord in the progression' do
      @progression.chords(@scale).last.show_notes.should == ["C", "E", "G", "B"]
    end
    
  end
  
  
end
