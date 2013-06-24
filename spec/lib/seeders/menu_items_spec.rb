require 'spec_helper'

describe Seeders::MenuItems do

  let(:seeder) { Seeders::MenuItems }

  it 'seeds menu items' do
    menu_item_count = MenuItem.count
    seeder.seed
    expect(MenuItem.count).to_not eq(menu_item_count)
  end

  it 'seeds ingredients associated with menu items' do
    seeder.seed
    expect(MenuItem.first.ingredients).to_not be_empty
  end

  it 'can be run multiple times without duplication' do
    seeder.seed
    menu_item_count = MenuItem.count
    seeder.seed
    expect(MenuItem.count).to eq(menu_item_count)
  end
end
