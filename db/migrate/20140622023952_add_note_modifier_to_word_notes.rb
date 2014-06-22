class AddNoteModifierToWordNotes < ActiveRecord::Migration
  def change
    add_column :word_notes, :note_modifier, :string
  end
end
