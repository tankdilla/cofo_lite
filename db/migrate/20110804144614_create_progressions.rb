class CreateProgressions < ActiveRecord::Migration
  def self.up
    create_table :progressions do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :progressions
  end
end
