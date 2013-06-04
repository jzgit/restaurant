require 'spec_helper'

describe Comment do

  it { should belong_to(:menu_item) }
  it { should validate_presence_of(:body) }

  describe "validations" do
    let(:comment) { FactoryGirl.build(:comment) }

    it "is valid when it has all required and valid attributes" do
      expect(comment).to be_valid
    end
  end
end
