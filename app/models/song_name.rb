class SongName < ActiveRecord::Base
  has_many :verses, order: :id, dependent: :destroy
  belongs_to :song, dependent: :destroy
  attr_accessible :description, :song_id, :title
end
