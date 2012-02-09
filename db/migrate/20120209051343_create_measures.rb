class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :song_id
      t.integer :order

      t.timestamps
    end
  end
end
