require 'spec_helper'

describe MenuItem do
  it { should have_many(:comments) }
  it { should have_many(:ingredients) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price_in_cents) }

  describe "displays price in dollars" do
    let(:menu_item1) { FactoryGirl.build(:menu_item, price_in_cents: 1309)}
    let(:menu_item2) { FactoryGirl.build(:menu_item, price_in_cents: 9)}

    it "converts to dollars for big numbers" do
      expect(menu_item1.price_in_dollars).to eql(13.09)
    end

    it "converts to dollars for small cents" do
      expect(menu_item2.price_in_dollars).to eql(0.09)
    end
  end
end
