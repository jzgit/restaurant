require 'spec_helper'

describe 'a user adds a new menu item' do

  # ACCEPTANCE CRITERIA
  # I can add menu item
  # I can see my new menu item

  it 'creates a new menu item' do
    name = 'fishsticks'
    description = 'a delicious fishy goodness'
    cost = 1000
    category = 'Seafood'

    visit new_menu_item_path
    fill_in "Name", with: name
    fill_in "Description", with: description
    fill_in "Price in cents", with: cost
    select category, from: "Category"
    click_on "Create Menu item"

    expect(page).to have_content name
    expect(page).to have_content description
    expect(page).to have_content cost
    expect(page).to have_content category
    expect(page).to have_content 'HERE IS THE MENU ITEM INDEX PAGE'
  end
end
