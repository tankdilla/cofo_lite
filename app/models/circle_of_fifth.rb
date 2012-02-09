class CircleOfFifth
  attr_accessor :circle_steps
  
  def initialize
    @circle_steps = CircleStep.all.order("sort order asc")
  end
  
  def steps
    
  end
  
  def next_step(circle_step)
    CircleStep.find_by_sort_order(:sort_order=>cycle_order(circle_step.sort_order))
  end
  
  def cycle_order(order)
    if order > @circle_steps.size
      order = order - @circle_steps.size
    end
    
    if order < 1
      order = order + @circle_steps.size
    end
    
    order
  end
end
