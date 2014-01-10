module SongsHelper
  def chord_at(measure, pos)
    if measure.notes_by_position[pos].size > 1
      measure.chord_at_position(pos)
    end
  end

  def all_notes(song)
    song.measures.map do |measure|
      measure.positions.map do |pos|
        measure.notes_by_position[pos].reverse.map do |measure_note|
          measure_note.name
        end
      end
    end.flatten(1)
  end
end
