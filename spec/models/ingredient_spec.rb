require 'spec_helper'

describe Ingredient do
  it { should belong_to(:menu_item) }

  it { should validate_presence_of(:name) }

end
