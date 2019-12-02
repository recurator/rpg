class CharacterType < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :name, uniqueness: true
  validates :avatar, attached: true, content_type: [:png, :jpeg]
end
