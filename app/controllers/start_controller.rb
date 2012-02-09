class StartController < ApplicationController
  def index
    reset_session
		@notes = Note.all
  end

end
