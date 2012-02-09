class CreateIntervals < ActiveRecord::Migration
  def self.up
    create_table :intervals do |t|
      t.string :name
      t.integer :half_step

      t.timestamps
    end
  end

  def self.down
    drop_table :intervals
  end
end
