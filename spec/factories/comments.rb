# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    menu_item_id 1
    body "MyText"
  end
end
