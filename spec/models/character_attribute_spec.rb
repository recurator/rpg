require 'rails_helper'

RSpec.describe CharacterAttribute, type: :model do
  it { should belong_to(:character_type) }
  it "is not valid without name" do
    character_attribute = CharacterAttribute.new(name: nil)
    expect(character_attribute).to_not be_valid
  end
  it "name must me unique within character type"
  it "is valid if value is =>0"
  it "is not valid without avatar" do
    character_attribute = CharacterAttribute.new(avatar: nil)
    expect(character_attribute).to_not be_valid
  end
end
