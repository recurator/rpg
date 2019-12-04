require 'rails_helper'

RSpec.describe CharacterAttribute, type: :model do
  it { should belong_to(:character_type) }

  it "is not valid without name" do
    character_attribute = build(:character_attribute, name: nil)
    character_attribute.valid?
    expect(character_attribute.errors[:name]).to include("can't be blank")
  end

  it "is not valid if attribute name already exists for same character type" do
    character_type = create(:character_type)
    record         = create(:character_attribute, character_type: character_type, name: "mana")
    instance       = build(:character_attribute,  character_type: character_type, name: "mana")
    instance.valid?
    expect(instance.errors[:name]).to include("has already been taken")
  end

  it "is valid if name is unique within character type" do
    first_character_type  = create(:character_type, name: "Sauron")
    second_character_type = create(:character_type, name: "Souroff")
    record         = create(:character_attribute, character_type: first_character_type, name: "mana")
    instance       = build(:character_attribute,  character_type: second_character_type, name: "mana")
    instance.valid?
    expect(instance.errors[:name]).to eq([])
  end

  it "is not valid without value" do
    character_attribute = build(:character_attribute, value: nil)
    character_attribute.valid?
    expect(character_attribute.errors[:value]).to include("can't be blank")
  end

  it "is valid if value is =>0" do
    character_attribute = build(:character_attribute, value: 10)
    expect(character_attribute.errors[:value]).to eq([])
  end

  it "is not valid without icon" do
    character_attribute = build(:character_attribute, icon: nil)
    expect(character_attribute).to_not be_valid
  end
end
