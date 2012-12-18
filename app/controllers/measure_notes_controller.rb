class MeasureNotesController < ApplicationController
  
  def edit
    @measure_note = MeasureNote.find(params[:id])
    setup_edit
    
    respond_to do |format|
      format.html #{ redirect_to store_url }
      format.js 
      
    end
  end
  
  def update
    measure_note = MeasureNote.where(id: params[:id]).first
    measure = Measure.where(id: params[:measure_id]).first
    song = Song.find(session[:song])
    
    if measure_note
      if params[:commit] == 'add'
        new_note = Note.find_by_name(params[:note])
        measure_note.note = new_note
        if params[:octave]
          measure_note.octave_number = params[:octave].to_i
        end
      elsif params[:commit] =~ /^invert/
        measure_note.invert(params[:commit].split(" ")[1])
      elsif params[:commit] == 'clear'
        measure.clear(:measure_note=>measure_note)
      end
      
      respond_to do |format|
        if measure_note.save
          format.html { redirect_to song_url(song) }
          format.js
        else
          format.html { render action: "edit" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to song_url(song) }
        format.js
      end
    end
  end
  
  def destroy
    
  end
  
  def setup_edit
    @song = Song.find(session[:song])
    
    @chord_names = Chord.all
    
    @key = session[:song_key] = @song.note.name
    
    if session[:scale].nil?
      scale = Scale.create_scale(@key)
    else
      scale = session[:scale]
    end
    
    @notes = scale.scale_notes
  end
end
