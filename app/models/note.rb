class Note < ActiveRecord::Base
  def next_note(mode_interval)
    Note.find_by_sort_order(cycle_order(self.sort_order + mode_interval.interval.half_step))
  end
  
  def previous_note(mode_interval)
    Note.find_by_sort_order(cycle_order(self.sort_order - mode_interval.interval.half_step))
  end
  
  def flat
    Note.find_by_sort_order(cycle_order(self.sort_order - 1))
  end
  
  def sharp
    Note.find_by_sort_order(cycle_order(self.sort_order + 1))
  end
  
  def cycle_order(order)
    if order > 12
      order = order - 12
    end
    
    if order < 1
      order = order + 12
    end
    
    order
  end

  class << self
    def simple_notes(notes_array)
      notes_array.collect do |n|
        if n.kind_of?(MeasureNote)
          n.note_name
        elsif n.kind_of?(Note)
          n.name
        elsif n.kind_of?(String)
          n
        end
      end
    end
  end
end
