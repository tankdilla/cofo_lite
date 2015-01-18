class VersesController < ApplicationController
  before_filter :get_song_name

  def index
    @verses = @song_name.verses

    @verse = Verse.new
    @edit = true

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verses }
    end
  end

  def show
    @verse = Verse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verse }
    end
  end

  def new
    @verse = Verse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @verse }
    end
  end

  def create
    if params[:all_words]
      verses = params[:all_words].split("\r\n")
      verses.each_with_index do |verse, index|
        @song_name.verses << Verse.new(line_number: index, words: verse)
      end

    else

      if params[:id]
        verse = Verse.find(params[:id])
        verse.update_attributes(words: params[:verse][:words])
      else
        verse = Verse.new(params[:verse])
        @song_name.verses << verse
      end
    end

    respond_to do |format|
      format.js {
        @edit = true
        @verse = Verse.new
        render 'update'
      }
      format.html { redirect_to song_name_verses_url(@song_name) }
    end
  end

  def edit
    @verse = Verse.find(params[:id])

    respond_to do |format|
      format.js {}
    end
  end

  def update # update_verse
    if params[:all_words]
      verses = params[:all_words].split("\r\n")
      verses.each_with_index do |verse, index|
        @song_name.verses << Verse.new(line_number: index, words: verse)
      end

    else

      if params[:id]
        verse = Verse.find(params[:id])
        verse.update_attributes(words: params[:verse][:words])
      else
        verse = Verse.new(params[:verse])
        @song_name.verses << verse
      end
    end

    respond_to { |format|
      format.html { redirect_to song_name_verses_url(@song_name) }
      format.js do
        @edit = true
        @verse = Verse.new
      end
    }
  end

  def destroy # delete_verse
    verse = Verse.find(params[:id])
    verse.destroy

    respond_to { |format|
      format.html { redirect_to song_name_edit_verses_url(@song_name) }
      format.js {
        @edit = true
        @verse = Verse.new
        render 'update'
      }
    }
  end

  def clone
    verse = Verse.find(params[:id])
    new_verse = Verse.new(verse.attributes.except(*%w(id created_at updated_at)))
    @song_name.verses << new_verse

    verse.word_notes.each { |n| new_verse.word_notes << WordNote.new(n.attributes.except(*%w(id verse_id created_at updated_at))) }

    respond_to { |format|
      format.js {
        @edit = true
        @verse = Verse.new
        render 'update'
      }
    }
  end

  private
  def get_song_name
    @song_name = SongName.find(params[:song_name_id])
  end
end
