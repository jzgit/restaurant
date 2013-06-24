class MenuItem < ActiveRecord::Base
  has_many :comments,
    dependent: :destroy

  has_many :ingredients,
    dependent: :destroy

  accepts_nested_attributes_for :ingredients,
    reject_if: lambda { |ingredient| ingredient[:name].blank? }

  attr_accessible :ingredients_attributes, :description, :name, :price_in_cents, :category

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price_in_cents
  validates_presence_of :category

  CATEGORIES = ['', 'Seafood', 'Vegetarian', 'Pasta', 'Meat']

  def price_in_dollars
    (price_in_cents.to_f / 100).round(2)
  end
end
