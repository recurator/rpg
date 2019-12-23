class User < ApplicationRecord
  has_many :character_types, dependent: :delete_all
  has_many :character_attributes, through: :character_types


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
