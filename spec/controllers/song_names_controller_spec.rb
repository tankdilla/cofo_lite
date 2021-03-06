require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SongNamesController do

  # This should return the minimal set of attributes required to create a valid
  # SongName. As you add validations to SongName, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SongNamesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all song_names as @song_names" do
      song_name = SongName.create! valid_attributes
      get :index, {}, valid_session
      assigns(:song_names).should eq([song_name])
    end
  end

  describe "GET show" do
    it "assigns the requested song_name as @song_name" do
      song_name = SongName.create! valid_attributes
      get :show, {:id => song_name.to_param}, valid_session
      assigns(:song_name).should eq(song_name)
    end
  end

  describe "GET new" do
    it "assigns a new song_name as @song_name" do
      get :new, {}, valid_session
      assigns(:song_name).should be_a_new(SongName)
    end
  end

  describe "GET edit" do
    it "assigns the requested song_name as @song_name" do
      song_name = SongName.create! valid_attributes
      get :edit, {:id => song_name.to_param}, valid_session
      assigns(:song_name).should eq(song_name)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SongName" do
        expect {
          post :create, {:song_name => valid_attributes}, valid_session
        }.to change(SongName, :count).by(1)
      end

      it "assigns a newly created song_name as @song_name" do
        post :create, {:song_name => valid_attributes}, valid_session
        assigns(:song_name).should be_a(SongName)
        assigns(:song_name).should be_persisted
      end

      it "redirects to the created song_name" do
        post :create, {:song_name => valid_attributes}, valid_session
        response.should redirect_to(SongName.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved song_name as @song_name" do
        # Trigger the behavior that occurs when invalid params are submitted
        SongName.any_instance.stub(:save).and_return(false)
        post :create, {:song_name => { "title" => "invalid value" }}, valid_session
        assigns(:song_name).should be_a_new(SongName)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SongName.any_instance.stub(:save).and_return(false)
        post :create, {:song_name => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested song_name" do
        song_name = SongName.create! valid_attributes
        # Assuming there are no other song_names in the database, this
        # specifies that the SongName created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SongName.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => song_name.to_param, :song_name => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested song_name as @song_name" do
        song_name = SongName.create! valid_attributes
        put :update, {:id => song_name.to_param, :song_name => valid_attributes}, valid_session
        assigns(:song_name).should eq(song_name)
      end

      it "redirects to the song_name" do
        song_name = SongName.create! valid_attributes
        put :update, {:id => song_name.to_param, :song_name => valid_attributes}, valid_session
        response.should redirect_to(song_name)
      end
    end

    describe "with invalid params" do
      it "assigns the song_name as @song_name" do
        song_name = SongName.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SongName.any_instance.stub(:save).and_return(false)
        put :update, {:id => song_name.to_param, :song_name => { "title" => "invalid value" }}, valid_session
        assigns(:song_name).should eq(song_name)
      end

      it "re-renders the 'edit' template" do
        song_name = SongName.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SongName.any_instance.stub(:save).and_return(false)
        put :update, {:id => song_name.to_param, :song_name => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested song_name" do
      song_name = SongName.create! valid_attributes
      expect {
        delete :destroy, {:id => song_name.to_param}, valid_session
      }.to change(SongName, :count).by(-1)
    end

    it "redirects to the song_names list" do
      song_name = SongName.create! valid_attributes
      delete :destroy, {:id => song_name.to_param}, valid_session
      response.should redirect_to(song_names_url)
    end
  end

end
