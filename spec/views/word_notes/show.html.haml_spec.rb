require 'spec_helper'

describe "word_notes/show" do
  before(:each) do
    @word_note = assign(:word_note, stub_model(WordNote,
      :verse_id => 1,
      :line_position => 2,
      :note_number => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
