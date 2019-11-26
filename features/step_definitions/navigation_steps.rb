When "I access a page" do
  get "/"
end

Given /^I am on the "(.*)" page$/ do |url|
  get url
end
