require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "relationships" do
    it { is_expected.to belong_to(:menu_item) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :menu_item }
    it { is_expected.to validate_presence_of :name }
  end
end
