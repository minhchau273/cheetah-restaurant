require 'rails_helper'

RSpec.describe Section, type: :model do
  describe "relationships" do
    it { is_expected.to have_many(:menu_items).dependent(:destroy) }
  end
end
