require 'factory_bot'

FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end

FactoryBot.define do

  factory :user do |f|
    f.username { Faker::Movies::HitchhikersGuideToTheGalaxy.character.delete " " }
    f.email    { "#{f.username}@example.net" }
    f.password { "#{f.username}123" }
  end

  factory :character_type do |f|
    user
    f.name   { Faker::Movies::HitchhikersGuideToTheGalaxy.specie }
    f.avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/dummy.png", 'image/png') }
  end

  factory :character_attribute do |f|
    character_type
    f.name  { Faker::Verb.base }
    f.value { rand(1..100) }
    f.icon  { fixture_file_upload("#{Rails.root}/spec/fixtures/dummy.png", 'image/png') }
  end
end
