FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "testuser#{n}" }
    password "password"
  end
end
