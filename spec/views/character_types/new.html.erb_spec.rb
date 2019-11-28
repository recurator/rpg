require 'rails_helper'

RSpec.describe "character_types/new", type: :view do
  before(:each) do
    assign(:character_type, CharacterType.new(
      :user => nil,
      :name => "MyString"
    ))
  end

  it "renders new character_type form" do
    render

    assert_select "form[action=?][method=?]", character_types_path, "post" do

      assert_select "input[name=?]", "character_type[user_id]"

      assert_select "input[name=?]", "character_type[name]"
    end
  end
end
