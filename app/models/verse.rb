class Verse < ActiveRecord::Base
  belongs_to :song_name
  
  attr_accessible :line_number, :song_id, :words
end
