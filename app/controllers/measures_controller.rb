class MeasuresController < ApplicationController
  
  def edit
    @measure_note = MeasureNote.find(params[:id])
    setup_edit
    
    respond_to do |format|
      format.html #{ redirect_to store_url }
      format.js 
      
    end
  end
  
  def update
    @measure = Measure.where(id: params[:id]).first
    song = Song.find(session[:song])
    if params[:action] == 'replace'
      
      respond_to do |format|
        if @measure.save
          format.html { redirect_to song_url(@song) }
          format.js
        else
          format.html { render action: "new" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to song_url(@song) }
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