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
end
