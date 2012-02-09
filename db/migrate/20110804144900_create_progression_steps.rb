class CreateProgressionSteps < ActiveRecord::Migration
  def self.up
    create_table :progression_steps do |t|
      t.integer :progression_id
      t.integer :chord_symbol_id
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :progression_steps
  end
end
