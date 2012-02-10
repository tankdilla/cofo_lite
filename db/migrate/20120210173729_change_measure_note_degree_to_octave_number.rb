class ChangeMeasureNoteDegreeToOctaveNumber < ActiveRecord::Migration
  def change
    rename_column :measure_notes, :degree, :octave_number
  end

end
