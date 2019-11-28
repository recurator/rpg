require 'rails_helper'

RSpec.describe "character_types/edit", type: :view do
  before(:each) do
    @character_type = assign(:character_type, CharacterType.create!(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit character_type form" do
    render

    assert_select "form[action=?][method=?]", character_type_path(@character_type), "post" do

      assert_select "input[name=?]", "character_type[user_id]"

      assert_select "input[name=?]", "character_type[name]"
    end
  end
end
