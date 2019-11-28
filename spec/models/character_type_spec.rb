require 'rails_helper'

RSpec.describe CharacterType, type: :model do
  describe 'Avatar' do
    it "is valid" do
      subject.avatar.attach(io: File.open(fixture_path + '/dummy.png'), filename: 'avatar.png', content_type: 'image/png')
      expect(subject.avatar).to be_attached
    end
  end
end
