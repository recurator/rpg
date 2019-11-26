Given "no current user" do
  signout_user
end

Then "the signin form should be shown" do
  assert_template "sessions/new"
end

Then /^I should\s?((?:not)?) be authorized/ do |present|
  assert_response present ? :unauthorized : :success
end

Given /^a registered user with the email "(.*)" with password "(.*)" exists$/ do |email, password|
  @user = double()
end

Then /^I should\s?((?:not)?) be signed in/ do |present|
  assert_equal controller.signed_in?, present.blank?
end
