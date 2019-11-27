Given "no current user" do
  delete '/users/sign_out'
end

Given /^a registered user with the email "(.*)" with password "(.*)" exists$/ do |email, password|
  FactoryBot.create(:user)
end

Then /^I should\s?((?:not)?) be signed in/ do |present|
  assert_equal controller.signed_in?, present.blank?
end
