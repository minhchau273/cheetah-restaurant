require 'rails_helper'

RSpec.describe MenuController, type: :controller do
  before do
    section1 = create(:section)
    section2 = create(:section, name: "Lunch")
    create(:menu_item, section: section1)
    create(:menu_item, section: section1, name: "Com tam", price: 25000)
    create(:menu_item, section: section1, name: "Bun bo Hue", price: 30000)
    create(:menu_item, section: section2)
  end

  describe "GET #index" do
    before do
      get :index
    end
    
    it "is success" do
      expect(response).to be_success
      expect(assigns(:sections).count).to eq 2
      expect(assigns(:menu_items).count).to eq 3
      expect(assigns(:section_id)).to eq 1
      expect(assigns(:sort)).to eq "alphabetical"
    end

    context "sorting by Alphabet is chosen by default" do
      before do
        get :index
      end

      it "sorts by Alphabet" do
        items = assigns(:menu_items)
        expected_items = ["Bun bo Hue", "Com tam", "Pho ga"]
        expect_order_item_with_list(items, expected_items)
      end
    end

    context "sorting by Price low to high" do
      before do
        get :index, sort: "price_low_to_high"
      end

      it "sorts by Price low to high" do
        items = assigns(:menu_items)
        expected_items = ["Com tam", "Bun bo Hue", "Pho ga"]
        expect_order_item_with_list(items, expected_items)
      end
    end

    context "sorting by Price high to low" do
      before do
        get :index, sort: "price_high_to_low"
      end

      it "sorts by Price high to low" do
        items = assigns(:menu_items)
        expected_items = ["Pho ga", "Bun bo Hue", "Com tam"]
        expect_order_item_with_list(items, expected_items)
      end
    end
  end

  def expect_order_item_with_list(items, expected_items)
    expect(items[0].name).to eq expected_items[0]
    expect(items[1].name).to eq expected_items[1]
    expect(items[2].name).to eq expected_items[2]
  end
end
