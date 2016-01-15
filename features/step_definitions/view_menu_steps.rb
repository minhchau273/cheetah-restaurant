Capybara.default_selector = :xpath

And "I go to Menu page" do
  visit menu_path
end

And "There are 2 sections with some items in each section" do
  @section1 = create(:section)
  @section2 = create(:section, name: "Lunch")
  create(:menu_item, section: @section1)
  create(:menu_item, section: @section1, name: "Com tam", price: 25000)
  create(:menu_item, section: @section1, name: "Bun bo Hue", price: 30000)
  create(:menu_item, section: @section2)
end

Then "I can see the the menu title" do
  expect(page).to have_content "#{RESTAURANT_NAME} Menu"
end

And "I can see 2 sections' names" do
  expect(page).to have_content "Breakfast"
  expect(page).to have_content "Lunch"
end

Then "I can see all menu items of Lunch section" do
  expect(page).to have_content "Pho ga"
end

Then "I can see the sort type is set Alphabetical by default" do
  expect(page).to have_content "Alphabetical"
end

Then(/^I can see all items are sorted by (.*?)$/) do |sort|
  list_item = case sort
              when "price low to high" then ["Com tam", "Bun bo Hue", "Pho ga"]
              when "price high to low" then ["Pho ga", "Bun bo Hue", "Com tam"]
              else ["Bun bo Hue", "Com tam", "Pho ga"]
              end
  expect_order_item_with_list(list_item)
end

def expect_order_item_with_list(list_item)
  base_xpath = "(//div[@class='card']//h4)"
  expect(page).to have_selector("#{base_xpath}[1]", :text => list_item[0])
  expect(page).to have_selector("#{base_xpath}[2]", :text => list_item[1])
  expect(page).to have_selector("#{base_xpath}[3]", :text => list_item[2])
end
