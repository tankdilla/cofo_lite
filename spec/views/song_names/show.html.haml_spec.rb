require 'spec_helper'

describe "song_names/show" do
  before(:each) do
    @song_name = assign(:song_name, stub_model(SongName,
      :title => "Title",
      :description => "Description",
      :song_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
  end
end
