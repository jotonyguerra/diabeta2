require 'rails_helper'

RSpec.describe "samples/index", type: :view do
  before(:each) do
    assign(:samples, [
      Sample.create!(
        :name => "Name"
      ),
      Sample.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of samples" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
