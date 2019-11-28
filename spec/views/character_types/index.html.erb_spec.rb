require 'rails_helper'

RSpec.describe "character_types/index", type: :view do
  before(:each) do
    assign(:character_types, [
      CharacterType.create!(
        :user => nil,
        :name => "Name"
      ),
      CharacterType.create!(
        :user => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of character_types" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
