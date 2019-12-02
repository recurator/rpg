class User < ApplicationRecord
  has_many :character_types, dependent: :delete_all


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
