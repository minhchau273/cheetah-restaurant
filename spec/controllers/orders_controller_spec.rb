require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:item) { create(:menu_item) }

  describe "GET #new" do
    before do
      get :new, menu_item_id: item.id
    end

    it "is success" do
      expect(assigns(:menu_item)).to eq item
    end
  end

  describe "POST #create" do
    context "successful order" do
      let(:customerName) { "Cheetah" }

      before do
        post :create, menu_item_id: item.id, order: { name: customerName }
      end

      it "redirects to Menu page" do
        expect(response).to redirect_to menu_path
        expect(flash["success"]).to eq "Order submitted. Thank you!"
      end
    end

    context "unsuccessful order" do
      before do
        post :create, menu_item_id: item.id, order: { name: "" }
      end

      it "goes back to Order page" do
        expect(response).to render_template :new
        expect(flash["error"]).to eq "Error: Name can't be blank"
      end
    end
  end
end
