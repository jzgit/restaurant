require 'spec_helper'

describe 'a user adds a new menu item' do

  # ACCEPTANCE CRITERIA
  # I can add menu item
  # I can see my new menu item

  let(:menu_attrs) do
    {
      name: 'Fishsticks',
      description: 'A delicious fishy goodness',
      cost: 1980,
      category: 'Seafood'
    }
  end

  it 'creates a new menu item' do
    visit new_menu_item_path
    fill_in_new_menu_item

    click_on "Create Menu item"

    expect_menu_item_to_be_on_page
  end

  it 'adds ingredients to a menu item upon creation' do
    visit new_menu_item_path
    fill_in_new_menu_item

    within "#ingredients" do
      fill_in "menu_item_ingredients_attributes_0_name", with: "Cod"
      fill_in "menu_item_ingredients_attributes_1_name", with: "Breadcrumbs"
      fill_in "menu_item_ingredients_attributes_2_name", with: "Magic"
    end

    click_on "Create Menu item"

    expect_menu_item_to_be_on_page

save_and_open_page
    expect(page).to have_content "Cod"
    expect(page).to have_content "Breadcrumbs"
    expect(page).to have_content "Magic"
  end

  def expect_menu_item_to_be_on_page
    expect(page).to have_content menu_attrs[:name]
    expect(page).to have_content menu_attrs[:description]
    expect(page).to have_content menu_attrs[:cost]
    expect(page).to have_content menu_attrs[:category]
    expect(page).to have_content 'HERE IS THE MENU ITEM INDEX PAGE'
  end

  def fill_in_new_menu_item
    fill_in "Menu Item Name", with: menu_attrs[:name]
    fill_in "Description", with: menu_attrs[:description]
    fill_in "Price in cents", with: menu_attrs[:cost]
    select menu_attrs[:category], from: "Category"
  end
end
