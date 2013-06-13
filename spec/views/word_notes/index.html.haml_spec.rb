require 'spec_helper'

describe "word_notes/index" do
  before(:each) do
    assign(:word_notes, [
      stub_model(WordNote,
        :verse_id => 1,
        :line_position => 2,
        :note_number => 3
      ),
      stub_model(WordNote,
        :verse_id => 1,
        :line_position => 2,
        :note_number => 3
      )
    ])
  end

  it "renders a list of word_notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
