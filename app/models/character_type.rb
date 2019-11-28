class CharacterType < ApplicationRecord
  belongs_to :user
  validates :name, uniqueness: true
end
