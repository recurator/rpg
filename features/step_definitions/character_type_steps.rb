Given "Character type {string} already exists" do |string|
  FactoryBot.create(:character_type)
end

Given "User {string} created character type {string}" do |username, kind|
  user = FactoryBot.create(:user, email: "#{username}@example.net", username: username, password: "#{username}123456")
  FactoryBot.create(:character_type, user: user, name: kind)
end
