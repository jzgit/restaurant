require 'spec_helper'

describe 'a user comments on a menu item' do

  # ACCEPTANCE CRITERIA
  # I can comment on a menu item from the menu item show page

  it 'comments on a menu item' do
    menu_item = FactoryGirl.create(:menu_item)
    visit menu_item_path(menu_item)
    fill_in "Comment", with: 'Great tasting yummy meal'
    click_on "Be Heard!"
    expect(page).to have_content "You have been HEARD, user."
  end

  it 'does not create invalid comments on a menu item' do
    menu_item = FactoryGirl.create(:menu_item)
    visit menu_item_path(menu_item)
    fill_in "Comment", with: ''
    click_on "Be Heard!"
    expect(page).to have_content "Nobody can HEAR you..."
  end
end
