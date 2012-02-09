class CreateChordSymbols < ActiveRecord::Migration
  def self.up
    create_table :chord_symbols do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :chord_symbols
  end
end
