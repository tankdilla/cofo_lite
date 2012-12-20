class AddIntervalIdToChordDefinition < ActiveRecord::Migration
  def change
  	add_column :chord_definitions, :interval_id, :integer
  end
end
