FactoryGirl.define do
  factory :topic do
    title { Faker::Lorem.word }
    user @user
  end
end
