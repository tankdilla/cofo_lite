class CreateNoteTypes < ActiveRecord::Migration
  def change
    create_table :note_types do |t|
      t.string :name
      t.string :count

      t.timestamps
    end
  end
end
