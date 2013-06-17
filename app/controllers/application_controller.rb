class ApplicationController < ActionController::Base
  protect_from_forgery

  def setup_song_measure_edit
    scale = session[:scale]
    @chord_names = Chord.all
    @notes = scale.scale_notes
  end
end
