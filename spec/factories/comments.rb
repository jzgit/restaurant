# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    association :menu_item
    menu_item_id 1
    body "fakefakefake comment"
  end
end
