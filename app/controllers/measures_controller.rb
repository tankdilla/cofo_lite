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
    #debugger
    position = params[:position]
    song = Song.find(session[:song])
    measure_note = params[:measure_note]

    if params[:commit] == 'clear'
      if !position.blank?
        @measure.clear(:position=>position)
      elsif !measure_note.blank?
        @measure.clear(:measure_note=>measure_note)
      end
    elsif params[:commit] == 'replace with chord'
      #debugger
      if params[:chord_note] && params[:chord_name]
        @measure.replace(position, {:chord_note=>params[:chord_note], :chord_name=>params[:chord_name]})
      elsif params[:chord]
        @measure.replace(position, {:chord_string=>params[:chord]})
      end
    elsif params[:commit] =~ /^invert/
      @measure.invert(position, params[:commit].split(" ")[1])
    end

    respond_to do |format|
      if @measure.save
        format.html { redirect_to song_url(song) }
        format.js
      else
        format.html { render action: "new" }
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
