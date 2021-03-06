class Verse < ActiveRecord::Base
  belongs_to :song_name
  has_many :word_notes, dependent: :destroy

  attr_accessible :line_number, :song_id, :words, :song_name_id

  def get_note_number_at(position)
    word_note_by_position(position)
  end

  def word_note_by_position(position)
    #word_notes.at_position(position).first
    word_notes.where(line_position: position).first
  end
end
