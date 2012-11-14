class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def show
    
    if !params[:id].nil?
      session[:song] = Song.where(:id=>params[:id].to_i).first.id
    else
      session[:song] ||= Song.create!({:note_id=>Note.find_by_name(session[:song_key])}).id
    end
    
    @song_chords = session[:song_chords]
    @song = Song.find(session[:song])
    
    @chord_names = Chord.all
    
    @key = session[:song_key] = @song.note.name
    
    if session[:scale].nil?
      scale = Scale.create_scale(@key)
    else
      scale = session[:scale]
    end
    
    @notes = scale.scale_notes
    @progressions = Progression.all
  end
  
  def create
    session[:song] = Song.create!({:note_id=>Note.find_by_name(params[:key]).id}).id
    
    redirect_to song_path(session[:song])
  end
  
  def add_to
  	song = Song.find(session[:song])
    if params[:note]
      song.add_to_song(:note=>Note.find_by_name(params[:note]))
    elsif params[:chord]
      chord_params = params[:chord].split(',')
      chord_note = chord_params[0]
      chord_number = chord_params[1]
      chord_symbol = ChordSymbol.find(chord_number.to_i)
      chord = Chord.create_chord({:base_note=>chord_note, :chord_letter=>chord_symbol.name})
      song.add_to_song(:chord=>chord)
    elsif params[:chord_note] && params[:chord_name]
      chord_note = params[:chord_note]
      chord_name = params[:chord_name]
      chord = Chord.create_chord({:base_note=>chord_note, :chord_name=>chord_name})
      song.add_to_song(:chord=>chord)
    elsif params[:progression]
      progression = Progression.find(params[:progression])
      scale = Scale.create_scale(session[:song_key])
      progression_chords = progression.chords(scale)
      progression_chords.each do |progression_chord|
        song.add_to_song(:chord => progression_chord)
      end
    end
    
    song.save!
    
    redirect_to song_path(song)
  end
  
  
  def chord_melody
    notes = %w{C D C}
  end
  
  def clear
    song = Song.find(session[:song])
    song.measures.each{|m| Measure.delete(m)}
    redirect_to song_path(song)
  end
  
  def play
    song = Song.find(session[:song])
    song.play
    redirect_to song_path(song)
  end

end
