require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe ".alert_class_for" do
    context "this key is not in hash" do
      it "returns key" do
        expect(alert_class_for(:key)).to eq "key"
      end
    end

    context "this key is in hash" do
      it "returns its value" do
        expect(alert_class_for(:success)).to eq "alert-success"
      end
    end
  end
end
