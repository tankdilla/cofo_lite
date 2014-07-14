class WordNote < ActiveRecord::Base
  # attr_accessible :line_position, :note_number, :verse_id
  has_many :voicings
  belongs_to :verse
  belongs_to :chord

  # scope :at_position, ->(number) { where(line_position: number) }

  def description
    desc = ''
    desc += note_modifier if note_modifier
    desc += note_number.to_s if note_number
    desc += chord.abbrev if chord_id
    desc
  end
end
