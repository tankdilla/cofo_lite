class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.integer :song_id
      t.integer :line_number
      t.string :words

      t.timestamps
    end
  end
end
