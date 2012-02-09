class CreateChordDefinitions < ActiveRecord::Migration
  def self.up
    create_table :chord_definitions do |t|
      t.integer :chord_id
      t.integer :scale_number
      t.string  :modifier
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :chord_definitions
  end
end
