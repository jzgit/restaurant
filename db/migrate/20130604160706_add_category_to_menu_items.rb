class AddCategoryToMenuItems < ActiveRecord::Migration
  def up
    add_column :menu_items, :category, :string
  end
  def down
    remove_column :menu_items, :category
  end
end
