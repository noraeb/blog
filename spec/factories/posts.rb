FactoryGirl.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Hipster.paragraph }
    created_at { Faker::Date.backward }
    user { FactoryGirl.create(:user) }
  end
end
