require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(email: Faker::Internet.email, password: "helloworld")}
  let(:topic) { Topic.create!(title: Faker::Lorem.word, user: user) }
  let(:bookmark) { Bookmark.create!(url: Faker::Internet.url, user: user)}

  it { is_expected.to belong_to(:bookmark) }
  it { is_expected.to belong_to(:user) }
end
