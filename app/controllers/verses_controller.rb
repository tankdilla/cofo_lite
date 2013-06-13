class VersesController < ApplicationController
  # GET /verses
  # GET /verses.json
  def index
    @verses = Verse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @verses }
    end
  end

  # GET /verses/1
  # GET /verses/1.json
  def show
    @verse = Verse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @verse }
    end
  end

  # GET /verses/new
  # GET /verses/new.json
  def new
    @verse = Verse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @verse }
    end
  end

  # GET /verses/1/edit
  def edit
    @verse = Verse.find(params[:id])
  end

  # POST /verses
  # POST /verses.json
  def create
    @verse = Verse.new(params[:verse])

    respond_to do |format|
      if @verse.save
        format.html { redirect_to @verse, notice: 'Verse was successfully created.' }
        format.json { render json: @verse, status: :created, location: @verse }
      else
        format.html { render action: "new" }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /verses/1
  # PUT /verses/1.json
  def update
    @verse = Verse.find(params[:id])

    respond_to do |format|
      if @verse.update_attributes(params[:verse])
        format.html { redirect_to @verse, notice: 'Verse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verses/1
  # DELETE /verses/1.json
  def destroy
    @verse = Verse.find(params[:id])
    @verse.destroy

    respond_to do |format|
      format.html { redirect_to verses_url }
      format.json { head :no_content }
    end
  end
end
