class CharacterAttribute < ApplicationRecord
  belongs_to :character_type
  has_one_attached :icon

  validates :name, presence: true
  validates_uniqueness_of :name, allow_blank: false, scope: :character_type
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :icon, attached: true, content_type: [:png, :jpeg]

  def data
    "#{name}: #{value}"
  end
end
