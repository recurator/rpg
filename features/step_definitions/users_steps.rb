Given "no current user" do
  delete '/users/sign_out'
end

Given /^a registered user "(.*)" with the email "(.*)" with password "(.*)" exists$/ do |username, email, password|
  User.find_by(email: email) || FactoryBot.create(:user, email: email, username: username, password: password)
end

Then /^I should\s?((?:not)?) be signed in/ do |present|
  assert_equal controller.signed_in?, present.blank?
end

Given /^User "(.*)" is logged in$/ do |username|
  email    = "#{username}@example.net"
  password = "#{username}123456"
  User.find_by(email: email) || FactoryBot.create(:user, email: email, username: username, password: password)
  visit '/users/sign_in'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Log in'
  expect(page).to have_text("Signed in successfully")
end
