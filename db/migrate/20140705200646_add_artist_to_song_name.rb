class AddArtistToSongName < ActiveRecord::Migration
  def change
    add_column :song_names, :artist, :string
    add_column :song_names, :genre, :string
    add_column :song_names, :album, :string
  end
end
