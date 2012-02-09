require 'spec_helper'

describe Note do
  context 'testing the cycle_order method' do
    before(:each) do
      @c = Note.where(:name=>"C").first
    end
    
    it 'should return the current number from cycle if within the limit' do
      @c.cycle_order(10).should == 10
    end
    
    it 'should cycle the order to the beginning if the sort order is greater than 12' do
      @c.cycle_order(14).should == 2
    end
    
    it 'should cycle the order to the end if the sort order is less than 1' do
      @c.cycle_order(0).should == 12
    end
  end

  context 'where note is "C"' do
    before(:each) do
      @c = Note.where(:name=>"C").first
    end
    
    describe 'testing sharp of the note' do
      it 'should find a sharp note and not be nil' do
        @c.sharp.should_not be_nil
      end
      
      it 'should be a sharp note that is a Note' do
        @c.sharp.is_a?(Note).should be_true
      end
      
      it 'should find the sharp to note C' do
        @c.sharp.name.should == "Db"
      end
    end
    
    describe 'testing flat of the note' do
      it 'should find a flat note and not be nil' do
        @c.flat.should_not be_nil
      end
      
      it 'should be a flat note that is a note' do
        @c.flat.is_a?(Note).should be_true
      end
      
      it 'should find the flat to note C' do
        @c.flat.name.should == "B"
      end
    end
    
    describe 'test next and previous note within mode "I" of C (C major)' do
      before(:each) do
        @mode = Mode.where(:letter => "I").first
      end
      
      it 'should return the next note from C as D, given the first interval of the mode (whole step)' do
        interval = @mode.mode_intervals.first
        next_note = @c.next_note(interval)
        next_note.name.should == "D"
      end
      
      it 'should return the previous note from C as B, given the last interval of the mode (half step)' do
        interval = @mode.mode_intervals.last
        next_note = @c.previous_note(interval)
        next_note.name.should == "B"
      end
      
      it 'should return the next note from D as E, given the second interval of the mode (whole step)' do
        interval = @mode.mode_intervals.first
        d = @c.next_note(interval)
        interval = @mode.mode_intervals.second
        next_note = d.next_note(interval)
        next_note.name.should == "E"
      end
      
      it 'should return the next note from E as F, given the third interval of the mode (whole step)' do
        interval = @mode.mode_intervals.third
        e = Note.where(:name=>"E").first
        next_note = e.next_note(interval)
        next_note.name.should == "F"
      end
      
      it 'should return the previous note from F as E, given the 3rd interval of the mode (half step)' do
        interval = @mode.mode_intervals.third
        e = Note.where(:name=>"F").first
        next_note = e.previous_note(interval)
        next_note.name.should == "E"
      end
      
    end
  end
  
end
