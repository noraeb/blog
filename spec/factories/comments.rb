FactoryGirl.define do
  factory :comment do
    text { Faker::Hipster.paragraph }
    post { FactoryGirl.create(:post) }
    user { FactoryGirl.create(:user) }
  end
end
