class SongNamesController < ApplicationController
  # GET /song_names
  # GET /song_names.json
  def index
    @song_names = SongName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @song_names }
    end
  end

  # GET /song_names/1
  # GET /song_names/1.json
  def show
    @song_name = SongName.find(params[:id])

    @show_notes = params[:toggle_chords] ? true : false

    @verses = @song_name.verses

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song_name }
    end
  end

  # GET /song_names/new
  # GET /song_names/new.json
  def new
    @song_name = SongName.new
    @notes = Note.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song_name }
    end
  end

  # GET /song_names/1/edit
  def edit
    @song_name = SongName.find(params[:id])
    @notes = Note.all
  end

  # POST /song_names
  # POST /song_names.json
  def create
    song = Song.create!({:note_id=>Note.find_by_name(params[:key]).id})
    @song_name = SongName.new(params[:song_name])
    @song_name.song_id = song.id

    respond_to do |format|
      if @song_name.save
        format.html { redirect_to @song_name, notice: 'Song name was successfully created.' }
        format.json { render json: @song_name, status: :created, location: @song_name }
      else
        format.html { render action: "new" }
        format.json { render json: @song_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /song_names/1
  # PUT /song_names/1.json
  def update
    @song_name = SongName.find(params[:id])

    respond_to do |format|
      if @song_name.update_attributes(params[:song_name])

        if params[:key]
          @song_name.song.update_attributes({:note_id=>Note.find_by_name(params[:key]).id})
        end

        format.html { redirect_to @song_name, notice: 'Song name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_names/1
  # DELETE /song_names/1.json
  def destroy
    @song_name = SongName.find(params[:id])
    @song_name.destroy

    respond_to do |format|
      format.html { redirect_to song_names_url }
      format.json { head :no_content }
    end
  end

  def edit_verses
    @song_name = SongName.find(params[:song_name_id])
    @verses = @song_name.verses
    @verse = Verse.new
    @edit = true
  end

  def edit_a_verse
    @song_name = SongName.find(params[:song_name_id])

    respond_to do |format|
      format.html {}
      format.js {
        @verse = Verse.find(params[:verse_id])
      }
    end
  end

  def update_verse
    @song_name = SongName.find(params[:song_name_id])

    if params[:all_words]
      verses = params[:all_words].split("\r\n")
      verses.each_with_index do |verse, index|
        @song_name.verses << Verse.new(line_number: index, words: verse)
      end

    else

      if params[:verse_id]
        verse = Verse.find(params[:verse_id])
        verse.update_attributes(words: params[:verse][:words])
      else
        verse = Verse.new(params[:verse])
        @song_name.verses << verse
      end
    end

    respond_to { |format|
      format.html { redirect_to song_name_edit_verses_url(@song_name) }
      format.js do
        @edit = true
        @verse = Verse.new
      end
    }
  end

  def delete_verse
    @song_name = SongName.find(params[:song_name_id])

    verse = Verse.find(params[:verse_id])
    verse.destroy

    respond_to { |format|
      format.html { redirect_to song_name_edit_verses_url(@song_name) }
      format.js {
        @edit = true
        @verse = Verse.new
        render 'update_verse'
      }
    }
  end

  def edit_song_note
    @song_name = SongName.find(params[:song_name_id])
    @edit_index = params[:edit_index].to_i
    @verse_id = params[:verse_id]
    @verse = Verse.find @verse_id

    respond_to { |format|
      format.js {
        @edit = params[:edit_note]
        @tag = "##{@verse_id}_#{@edit_index}"
      }
    }
  end

  def add_song_note
    @song_name = SongName.find(params[:song_name_id])

    word_note_params = params[:word_note]

    existing = WordNote.where(verse_id: word_note_params[:verse_id], line_position: word_note_params[:line_position]).first
    if existing.present?
      existing.update_attributes(note_number: word_note_params[:note_number], note_modifier: word_note_params[:note_modifier])
    else
      WordNote.create!(params[:word_note])
    end

    respond_to { |format|
      format.js {
        @edit = true
        @verse = Verse.new
        render 'update_verse'
      }
    }
  end
end
