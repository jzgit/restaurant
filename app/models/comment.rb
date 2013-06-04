class Comment < ActiveRecord::Base
  attr_accessible :body, :menu_item_id

  belongs_to :menu_item

  validates_presence_of :body
end
