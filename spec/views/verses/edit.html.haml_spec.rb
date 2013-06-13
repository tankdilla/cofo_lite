require 'spec_helper'

describe "verses/edit" do
  before(:each) do
    @verse = assign(:verse, stub_model(Verse,
      :song_id => 1,
      :line_number => 1,
      :words => "MyString"
    ))
  end

  it "renders the edit verse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", verse_path(@verse), "post" do
      assert_select "input#verse_song_id[name=?]", "verse[song_id]"
      assert_select "input#verse_line_number[name=?]", "verse[line_number]"
      assert_select "input#verse_words[name=?]", "verse[words]"
    end
  end
end
