class ProgressionStep < ActiveRecord::Base
  belongs_to :progression
  belongs_to :chord_symbol
  
end
