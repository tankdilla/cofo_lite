class Verse < ActiveRecord::Base
  belongs_to :song_name
  has_many :word_notes, :dependent=>:destroy
  
  attr_accessible :line_number, :song_id, :words
end
