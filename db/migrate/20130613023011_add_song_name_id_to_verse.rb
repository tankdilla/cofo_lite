class AddSongNameIdToVerse < ActiveRecord::Migration
  def change
    add_column :verses, :song_name_id, :integer
  end
end
