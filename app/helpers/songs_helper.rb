module SongsHelper
  def chord_at(measure, pos)
    if measure.notes_by_position[pos].size > 1
      measure.chord_at_position(pos)
    end
  end
end
