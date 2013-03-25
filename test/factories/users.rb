# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Michael"
    email "michael@gmail.com"
    password "12345"
    password_confirmation "12345"
  end
end
