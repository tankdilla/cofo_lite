class CreateVoicings < ActiveRecord::Migration
  def change
    create_table :voicings do |t|
      t.integer :chord_number
      t.string :chord_id

      t.timestamps
    end
  end
end
