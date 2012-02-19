class SongsController < ApplicationController
  def index
#    session[:song_chords] ||= Array.new    
    session[:song_key] ||= params[:key]    
  	session[:song] ||= Song.create!({:note_id=>Note.find_by_name(session[:song_key])}).id
    
    @song_chords = session[:song_chords]
    @song = Song.find(session[:song])
    
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
  	song = Song.find(session[:song])
    if params[:note]
      song.add_to_song(:note=>params[:note])
    elsif params[:chord]
      chord_params = params[:chord].split(',')
      chord_note = chord_params[0]
      chord_number = chord_params[1]
      chord_symbol = ChordSymbol.find(chord_number.to_i)
      chord = Chord.create_chord({:base_note=>chord_note, :chord_letter=>chord_symbol.name})
      song.add_to_song(:chord=>chord)
    elsif params[:progression]
      progression = Progression.find(params[:progression])
      scale = Scale.create_scale(session[:song_key])
      progression_chords = progression.chords(scale)
      progression_chords.each do |progression_chord|
        session[:song_chords] << progression_chord.show_notes
        song.add_to_song(:chord => progression_chord.show_notes)
      end
    end
    
    song.save!
    
    redirect_to songs_path
  end

end
