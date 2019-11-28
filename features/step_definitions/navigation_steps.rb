Given /^I am on the "(.*)" page$/ do |url|
  visit url
end

When /^I press "(.*)"$/ do |btn|
  click_button btn
end

When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in field, with: value
end

Then /^I should see "(.*)"$/ do |text|
  expect(page).to have_content(/#{text}/)
end

Then /^I should not see "(.*)"$/ do |text|
  expect(page).not_to have_content(/#{text}/)
end

When /^I follow "(.*)"$/ do |link|
  click_link link
end
