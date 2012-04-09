class ChangeMeasureNoteNoteToNoteId < ActiveRecord::Migration
  def change
    rename_column :measure_notes, :note, :note_id
  end

end
