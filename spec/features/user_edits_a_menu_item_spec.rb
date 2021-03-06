require 'spec_helper'

describe 'a user edits a menu item' do

  # ACCEPTANCE CRITERIA
  # I can edit menu item
  # I can see my updated menu item

  it 'edits a menu item' do
    menu_item = FactoryGirl.create(:menu_item)
    name = 'fishsticks'
    description = 'a delicious fishy goodness'
    cost = 2000
    category = 'Seafood'

    visit edit_menu_item_path(menu_item)
    save_and_open_page
    expect(page).to have_content 'Edit your menu item'
    fill_in "Name", with: name
    fill_in "Description", with: description
    fill_in "Price in cents", with: cost
    select category, from: "Category"
    click_on "Update Menu item"

    expect(page).to have_content name
    expect(page).to have_content description
    expect(page).to have_content cost
    expect(page).to have_content category
    expect(page).to have_content 'HERE IS THE MENU ITEM INDEX PAGE'
    expect(page).to have_content 'Menu item was successfully updated!! Hooray'
  end
end
