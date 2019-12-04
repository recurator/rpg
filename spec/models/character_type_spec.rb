require 'rails_helper'

RSpec.describe CharacterType, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:character_attributes) }

  it "is not valid without name" do
    character_type = build(:character_type, name: nil)
    character_type.valid?
    expect(character_type.errors[:name]).to include("can't be blank")
  end

  it "name must be unique" do
    saved_character_type = create(:character_type, name: "Marvin")
    new_character_type   = build(:character_type, name: "Marvin")
    new_character_type.valid?
    expect(new_character_type.errors[:name]).to include("has already been taken")
  end

  it "is not valid without avatar" do
    character_type = build(:character_type, avatar: nil)
    expect(character_type).to_not be_valid
  end
end
