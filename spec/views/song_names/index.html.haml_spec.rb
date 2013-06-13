require 'spec_helper'

describe "song_names/index" do
  before(:each) do
    assign(:song_names, [
      stub_model(SongName,
        :title => "Title",
        :description => "Description",
        :song_id => 1
      ),
      stub_model(SongName,
        :title => "Title",
        :description => "Description",
        :song_id => 1
      )
    ])
  end

  it "renders a list of song_names" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
