require 'spec_helper'

describe "song_names/new" do
  before(:each) do
    assign(:song_name, stub_model(SongName,
      :title => "MyString",
      :description => "MyString",
      :song_id => 1
    ).as_new_record)
  end

  it "renders new song_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", song_names_path, "post" do
      assert_select "input#song_name_title[name=?]", "song_name[title]"
      assert_select "input#song_name_description[name=?]", "song_name[description]"
      assert_select "input#song_name_song_id[name=?]", "song_name[song_id]"
    end
  end
end
