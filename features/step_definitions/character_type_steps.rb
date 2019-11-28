Given "User {string} created character type {string}" do |username, kind|
  create_user(username).tap { |user| create_character_type(kind, user) }
end

When "I delete character type {string} created by user {string}" do |kind, username|
  character_type = User.find_by(username: username).character_types.find_by(name: kind)
  delete "/character_types/#{character_type.id}"
end

def create_user(username)
  FactoryBot.create(:user, email: "#{username}@example.net", username: username, password: "#{username}123456")
end

def create_character_type(kind, user)
  FactoryBot.create(:character_type, user: user, name: kind)
end
