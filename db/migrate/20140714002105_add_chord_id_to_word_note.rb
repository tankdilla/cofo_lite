class AddChordIdToWordNote < ActiveRecord::Migration
  def change
    add_column :word_notes, :chord_id, :integer
  end
end
