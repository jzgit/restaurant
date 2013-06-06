class Ingredient < ActiveRecord::Base
  attr_accessible :name

  belongs_to :menu_item

  validates_presence_of :name
end
