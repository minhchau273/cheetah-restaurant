require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:menu_item) { build(:menu_item) }
  
  describe "relationships" do
    it { is_expected.to belong_to(:section) }
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end

  describe "#image_url_or_default" do
    let(:expected_url) { "#{MenuItem::IMAGE_BASE_URL}Pho+ga" }

    context "this item has image url" do
      before do
        menu_item.image_url = expected_url
      end

      it "returns its image url" do
        expect(menu_item.image_url_or_default).to eq expected_url
      end
    end

    context "this item does have image url" do
      it "generates a default url" do
        expect(menu_item.image_url_or_default).to eq expected_url
      end
    end
  end

  describe "#formated_price" do
    expected_price = "50,000 VND"

    before do
      menu_item.price = 50000
    end

    it "returns Vietnamese formated price" do
      expect(menu_item.formated_price).to eq expected_price
    end
  end
end
