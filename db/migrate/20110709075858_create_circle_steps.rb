class CreateCircleSteps < ActiveRecord::Migration
  def self.up
    create_table :circle_steps do |t|
      t.string :note
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :circle_steps
  end
end
