class WordNotesController < ApplicationController
  # GET /word_notes
  # GET /word_notes.json
  def index
    @word_notes = WordNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_notes }
    end
  end

  # GET /word_notes/1
  # GET /word_notes/1.json
  def show
    @word_note = WordNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word_note }
    end
  end

  # GET /word_notes/new
  # GET /word_notes/new.json
  def new
    @word_note = WordNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word_note }
    end
  end

  # GET /word_notes/1/edit
  def edit
    @word_note = WordNote.find(params[:id])
  end

  # POST /word_notes
  # POST /word_notes.json
  def create
    @word_note = WordNote.new(params[:word_note])

    respond_to do |format|
      if @word_note.save
        format.html { redirect_to @word_note, notice: 'Word note was successfully created.' }
        format.json { render json: @word_note, status: :created, location: @word_note }
      else
        format.html { render action: "new" }
        format.json { render json: @word_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /word_notes/1
  # PUT /word_notes/1.json
  def update
    @word_note = WordNote.find(params[:id])

    respond_to do |format|
      if @word_note.update_attributes(params[:word_note])
        format.html { redirect_to @word_note, notice: 'Word note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_notes/1
  # DELETE /word_notes/1.json
  def destroy
    @word_note = WordNote.find(params[:id])
    @word_note.destroy

    respond_to do |format|
      format.html { redirect_to word_notes_url }
      format.json { head :no_content }
    end
  end
end
