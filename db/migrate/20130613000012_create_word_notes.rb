class CreateWordNotes < ActiveRecord::Migration
  def change
    create_table :word_notes do |t|
      t.integer :verse_id
      t.integer :line_position
      t.integer :note_number

      t.timestamps
    end
  end
end
