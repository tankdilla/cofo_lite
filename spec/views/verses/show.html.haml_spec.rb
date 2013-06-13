require 'spec_helper'

describe "verses/show" do
  before(:each) do
    @verse = assign(:verse, stub_model(Verse,
      :song_id => 1,
      :line_number => 2,
      :words => "Words"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Words/)
  end
end
