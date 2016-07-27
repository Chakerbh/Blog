FactoryGirl.define do
  factory :post do
    sequence(:id){ |n| n }
    sequence(:title) { |n| "Post title #{n}" }
    body "Post body"
    sequence(:slug) { |n| "Post title #{n}" }
  end
end
