require 'factory_bot'

FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end

FactoryBot.define do
  factory :user do |f|
    f.email    { 'jabre@example.net' }
    f.username { 'jabre' }
    f.password { 'secret' }
  end

  factory :character_type do |f|
    user
    f.name { 'Druid' }

    f.avatar { fixture_file_upload("#{Rails.root}/spec/fixtures/dummy.png", 'image/png') }
  end
end
