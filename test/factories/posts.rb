FactoryGirl.define do
  factory :post do
    title Faker::Lorem.words
    categories  Faker::Lorem.words
    content Faker::Lorem.paragraph
  end
end