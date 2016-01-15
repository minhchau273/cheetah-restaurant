When "I choose Order an item" do
  find(:xpath, "(//a[contains(@href, 'orders/new')])[1]").click
end

Then "I can see Order page" do
  step "I can see \"Order for\""
end

When "I input name" do
  fill_in "order_name", with: "Cheetah"
end

Then "I can see sucessful message" do
  step "I can see \"#{ORDER_SUCCESSFULLY_MESSAGE}\""
end

Then "I can see error message" do
  step "I can see \"#{ORDER_WITHOUT_NAME_ERROR}\""
end
