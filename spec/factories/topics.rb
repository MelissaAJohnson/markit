FactoryGirl.define do
  factory :topic do
    title { Faker::Lorem.word }
    user
  end
end
