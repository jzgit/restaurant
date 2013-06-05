require 'spec_helper'

describe Comment do
  it { should belong_to(:menu_item) }
  it { should validate_presence_of(:menu_item) }
  it { should validate_presence_of(:body) }
end
