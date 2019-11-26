When /^I press "(.*)"$/ do |btn|
  click_button btn
end

When /^I follow "(.*)"$/ do |link|
  click_link link
end

When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in field, with: value
end

Then /^I should see "(.*)"$/ do |text|
  assert !!(response.body =~ /#{text}/m), response.body
end

Then /^I should be redirected to "(.*)"$/ do |path|
  assert_template path.gsub(/^\//, '')
  follow_redirect! if response.redirect?
end

And /^I attach the file at "(.*)" to "(.*)"$/ do |path, field|
  attach_file(field, path)
end
