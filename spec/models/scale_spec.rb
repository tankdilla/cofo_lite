require 'spec_helper'

describe Scale do
  describe 'should return a scale of notes given the starting note (the key note), and the mode of "I"' do
    before(:each) do
      @scale = Scale.create_scale("A", "I")
    end
    
    context 'testing the create_scale method' do
      it 'should not be nil' do
        @scale.should_not be_nil
      end
      
      it 'should be a Scale class' do
        @scale.is_a?(Scale).should be_true
      end
      
      it 'should have 7 scale notes' do
        @scale.scale_notes.size.should eql(7)
      end
      
      it 'should have scale notes that are of the class ScaleNote' do
        @scale.scale_notes.each{|n| n.is_a?(ScaleNote).should be_true}
      end
      
      it 'should have a key note of "A"' do
        @scale.key_note.should == "A"
      end
      
      it 'should have a mode of "I"' do
        @scale.mode.should == "I"
      end
      
      it 'should return a "I" scale if "major" is passed as the second argument' do
        scale = Scale.create_scale("A", "major")
        scale.mode.should == "I"
      end
    end
    
    context 'testing the get_note method' do
      it 'should return a Note' do
        @scale.get_note({:scale_number=>1}).is_a?(Note).should be_true
      end
      
      [[1, "A"], [2, "B"], [3, "Db"], [4, "D"], [5, "E"], [6, "Gb"], [7, "Ab"], [8, "A"], [9, "B"], [10, "Db"]].each do |h, k|
        it "should return the #{h} note as #{k}" do
          @scale.get_note({:scale_number=>h}).name.should == k
        end
      end
      
      it 'should return the flat 3 note as "C"' do
        @scale.get_note({:scale_number=>3, :modifier=>"b"}).name.should == "C"
      end
    end
    
    context 'testing the get_position method' do
      it 'should return an integer' do
        note, modifier = @scale.get_position(:note=>"A")
        note.should be_a(Fixnum)
        note.should == 1
        modifier.should be_nil
      end
      
      it 'should return an integer and a modifier' do
        pending
        note, modifier = @scale.get_position(:note=>"D")
        note.should be_a(Fixnum)
        modifier.should == "b"
        note.should == 3
      end
    end
  end
end
