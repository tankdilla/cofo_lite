class AddSortOrderToMeasureNotes < ActiveRecord::Migration
  def change
  	add_column :measure_notes, :sort_order, :integer
  end
end
