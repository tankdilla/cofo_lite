class SongName < ActiveRecord::Base
  has_many :verses, :dependent=>:destroy
  attr_accessible :description, :song_id, :title
end
