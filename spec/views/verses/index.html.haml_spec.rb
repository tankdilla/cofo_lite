require 'spec_helper'

describe "verses/index" do
  before(:each) do
    assign(:verses, [
      stub_model(Verse,
        :song_id => 1,
        :line_number => 2,
        :words => "Words"
      ),
      stub_model(Verse,
        :song_id => 1,
        :line_number => 2,
        :words => "Words"
      )
    ])
  end

  it "renders a list of verses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Words".to_s, :count => 2
  end
end
