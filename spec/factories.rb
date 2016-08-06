FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "secure"
  end

  factory :post do
    sequence(:id){ |n| n }
    sequence(:title) { |n| "Post title #{n}" }
    body "Post body"
    sequence(:slug) { |n| "Post title #{n}" }
    view_count 0
    draft false
  end
end
