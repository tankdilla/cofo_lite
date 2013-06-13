require 'spec_helper'

describe "word_notes/edit" do
  before(:each) do
    @word_note = assign(:word_note, stub_model(WordNote,
      :verse_id => 1,
      :line_position => 1,
      :note_number => 1
    ))
  end

  it "renders the edit word_note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", word_note_path(@word_note), "post" do
      assert_select "input#word_note_verse_id[name=?]", "word_note[verse_id]"
      assert_select "input#word_note_line_position[name=?]", "word_note[line_position]"
      assert_select "input#word_note_note_number[name=?]", "word_note[note_number]"
    end
  end
end
