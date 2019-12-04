class CharacterType < ApplicationRecord
  belongs_to       :user
  has_many         :character_attributes, dependent: :delete_all
  has_one_attached :avatar

  accepts_nested_attributes_for :character_attributes, allow_destroy: true

  validates :name, uniqueness: true, presence: true
  validates :avatar, attached: true, content_type: [:png, :jpeg]
end
