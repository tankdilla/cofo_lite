class Verse < ActiveRecord::Base
  belongs_to :song_name
  has_many :word_notes, :dependent=>:destroy
  
  attr_accessible :line_number, :song_id, :words

  def get_note_number_at(position)
    word_note_by_position(position).try(:note_number)
  end

  def word_note_by_position(position)
    #word_notes.at_position(position).first
    word_notes.where(line_position: position).first
  end
end
