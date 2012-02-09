class CreateModeIntervals < ActiveRecord::Migration
  def self.up
    create_table :mode_intervals do |t|
      t.integer :mode_id
      t.integer :interval_id
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :mode_intervals
  end
end
