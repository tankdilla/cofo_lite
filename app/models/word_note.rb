class WordNote < ActiveRecord::Base
  # attr_accessible :line_position, :note_number, :verse_id
  has_many :voicings
  belongs_to :verse

  # scope :at_position, ->(number) { where(line_position: number) }
end
