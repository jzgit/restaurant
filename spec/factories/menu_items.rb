# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu_item do
    name "Meatballs and Swordfish"
    description "MyText"
    price_in_cents 1
    category "Seafood"
  end
end
