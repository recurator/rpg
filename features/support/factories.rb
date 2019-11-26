require 'factory_bot'

FactoryBot.define do
  factory :user do |f|
    f.email 'jabre@example.net'
    f.username 'jabre'
    f.password 'secret'
  end
end
