Given "I am at Home page" do
  visit '/'
end

When(/^I click "(.*?)"$/) do |button|
  click_on button
end

Then(/^I can see "(.*?)"$/) do |content|
  expect(page).to have_content content
end