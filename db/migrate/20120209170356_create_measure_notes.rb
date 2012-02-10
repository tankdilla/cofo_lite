class CreateMeasureNotes < ActiveRecord::Migration
  def change
    create_table :measure_notes do |t|
      t.integer :measure_id
      t.string :note
      t.integer :degree
      t.decimal :position
      t.integer :note_type_id

      t.timestamps
    end
  end
end
