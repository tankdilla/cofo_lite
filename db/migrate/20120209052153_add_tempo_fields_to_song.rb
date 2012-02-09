class AddTempoFieldsToSong < ActiveRecord::Migration
  def change
  	add_column :songs, :description, :string
  	add_column :songs, :tempo, :string
  	add_column :songs, :time_signature, :string
  end
end
