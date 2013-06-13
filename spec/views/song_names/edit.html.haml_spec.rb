require 'spec_helper'

describe "song_names/edit" do
  before(:each) do
    @song_name = assign(:song_name, stub_model(SongName,
      :title => "MyString",
      :description => "MyString",
      :song_id => 1
    ))
  end

  it "renders the edit song_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", song_name_path(@song_name), "post" do
      assert_select "input#song_name_title[name=?]", "song_name[title]"
      assert_select "input#song_name_description[name=?]", "song_name[description]"
      assert_select "input#song_name_song_id[name=?]", "song_name[song_id]"
    end
  end
end
