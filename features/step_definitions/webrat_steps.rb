When /^I press "(.*)"$/ do |btn|
  click_button btn
end

When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in field, with: value
end

Then /^I should see "(.*)"$/ do |text|
  expect(page).to have_content(/#{text}/)
end
