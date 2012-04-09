class ChangeMeasureNoteNoteIdToInteger < ActiveRecord::Migration
  def up
    change_column :measure_notes, :note_id, :integer
  end

  def down
    change_column :measure_notes, :note_id, :string
  end
end
