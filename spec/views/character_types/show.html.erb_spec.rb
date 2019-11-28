require 'rails_helper'

RSpec.describe "character_types/show", type: :view do
  before(:each) do
    @character_type = assign(:character_type, CharacterType.create!(
      :user => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
