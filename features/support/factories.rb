require 'factory_bot'

FactoryBot.define do
  factory :user do |f|
    f.email    { 'jabre@example.net' }
    f.username { 'jabre' }
    f.password { 'secret' }
  end

  factory :character_type do |f|
    user
    f.name { 'Druid' }
  end
end
