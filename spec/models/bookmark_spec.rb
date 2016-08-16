require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:email) { Faker::Internet.email }
  let(:user) { User.create!(email: email, password: 'helloworld') }
  let(:title) { Faker::Lorem.word }
  let(:topic) { Topic.create!(title: title, user: user) }
  let(:url) { Faker::Internet.url }
  let(:bookmark) { Bookmark.create!(url: url, topic: topic) }

  it {is_expected.to belong_to(:topic)}

  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:topic) }

  describe "attributes" do
    it "has url" do
      expect(bookmark).to have_attributes(url: url)
    end
  end
end
