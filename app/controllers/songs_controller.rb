class SongsController < ApplicationController
  def index
		if session[:song_chords].nil?
      session[:song_chords] = Array.new
    end
    
    if params[:key] && session[:song_key].nil?
      session[:song_key] = params[:key]
    end
    
    @song_chords = session[:song_chords]
    
    @key = session[:song_key]
    if session[:scale].nil?
      scale = Scale.create_scale(@key)
    else
      scale = session[:scale]
    end
    
    @notes = scale.scale_notes
    @progressions = Progression.all
    
  end
  
  def add_to
    if params[:note]
      session[:song_chords] << [params[:note]]
    elsif params[:chord]
      chord_params = params[:chord].split(',')
      chord_note = chord_params[0]
      chord_number = chord_params[1]
      chord_symbol = ChordSymbol.find(chord_number.to_i)
      chord = Chord.create_chord({:base_note=>chord_note, :chord_letter=>chord_symbol.name})
      session[:song_chords] << chord.show_notes
    elsif params[:progression]
      progression = Progression.find(params[:progression])
      scale = Scale.create_scale(session[:song_key])
      progression_chords = progression.chords(scale)
      progression_chords.each do |p|
        session[:song_chords] << p.show_notes
      end
    end
    
    redirect_to songs_path
  end

end
