class ChordSymbol < ActiveRecord::Base
  has_many :progression_steps
end
