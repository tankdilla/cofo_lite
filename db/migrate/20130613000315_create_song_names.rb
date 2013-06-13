class CreateSongNames < ActiveRecord::Migration
  def change
    create_table :song_names do |t|
      t.string :title
      t.string :description
      t.integer :song_id

      t.timestamps
    end
  end
end
