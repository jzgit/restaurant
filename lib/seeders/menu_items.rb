module Seeders
  module MenuItems
    class << self
      def seed
        MenuItem.destroy_all

        menu_items.each do |name, array|
          item = MenuItem.new
          item.name = name
          item.category = array.shift
          item.price_in_cents = 1000
          item.description = "I'm yummy"

          array.each do |ingredient|
            new_ingredient = Ingredient.create({name: ingredient})
            item.ingredients << new_ingredient
          end

          item.save
        end
      end

      def menu_items
        {
          "Bonnie's Crab Cakes" => ['Seafood', 'lump crabmeat', 'breadcrumbs', 'seasoning', 'pepper', 'egg', 'mayo', 'mustard'],
          "Steak Tacos" => ['Meat', 'seasoning', 'flank steak', 'tortillas', 'salsa'],
          "Sausage Pizza" => ['Meat', 'pizza dough', 'tomato sauce', 'cheese', 'sausage']
        }
      end
    end
  end
end

  # create_table "ingredients", :force => true do |t|
  #   t.string   "name"
  #   t.integer  "menu_item_id"
  #   t.datetime "created_at",   :null => false
  #   t.datetime "updated_at",   :null => false
  # end

  # create_table "menu_items", :force => true do |t|
  #   t.string   "name",           :null => false
  #   t.text     "description",    :null => false
  #   t.integer  "price_in_cents", :null => false
  #   t.datetime "created_at",     :null => false
  #   t.datetime "updated_at",     :null => false
  #   t.string   "category",       :null => false
  # end
