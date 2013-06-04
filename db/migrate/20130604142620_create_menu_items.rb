class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price_in_cents, null: false

      t.timestamps
    end
  end
end
