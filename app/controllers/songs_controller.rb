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

    unless params[:note_style]
      session[:note_style] ||= 'lead_sheet'
    else
      session[:note_style] = params[:note_style]
    end

    @song_chords = session[:song_chords]
    @song = Song.find(session[:song])

    @key = session[:song_key] = @song.note.name

    if session[:scale].nil?
      scale = Scale.create_scale(@key)
      session[:scale] = scale
    else
      scale = params[:all_notes] == '1' ? Scale.create_scale(@key, 'all') : session[:scale]
    end

    # @notes = scale.scale_notes
    @progressions = Progression.all

    @chord_names = Chord.all
    @notes = scale.scale_notes
  end

  def create
    session[:song] = Song.create!({:note_id=>Note.find_by_name(params[:key]).id}).id

    redirect_to song_path(session[:song])
  end

  def add_to
  	song = Song.find(session[:song])

    if params[:note]
      song.add_to_song(:note=>Note.find_by_name(params[:note]))
    elsif params[:chord] ||
      (params[:chord_note] && params[:chord_name])

      options = {}
    	options[:chord_string] = params[:chord]
    	options[:chord_note] = params[:chord_note]
    	options[:chord_name] = params[:chord_name]
    	options[:melody_note] = params[:melody_note]

      song.add_chord(options)
    elsif false

      song.add_chord(:chord_note=>params[:chord_note], :chord_name=>params[:chord_name])
    elsif params[:progression]

      song.add_progression(:progression=>params[:progression], :song_key=>session[:song_key])
    end

    song.save!

    redirect_to song_path(song)
  end

  def clear
    song = Song.find(session[:song])
    song.measures.each{|m| Measure.delete(m)}
    redirect_to song_path(song)
  end

  def play
    song = Song.find(session[:song])
    song.play

    respond_to {|format|
      format.js { redirect_to song_path(song) }
    }
  end

  def verses
    song = Song.find(session[:song])
    verses = song.verses
  end

end
