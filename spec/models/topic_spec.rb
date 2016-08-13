require 'rails_helper'
require 'faker'

RSpec.describe Topic, type: :model do
  let(:title) { Faker::Lorem.word }
  let(:email) { Faker::Internet.email }
  let(:user) { User.create!(email: email, password: 'helloworld') }
  let(:topic) { Topic.create!(title: title, user: user) }

  it { is_expected.to have_many(:bookmarks) }

  describe "attributes" do
    it "has title and user attributes" do
      expect(topic).to have_attributes(title: title, user: user)
    end
  end
end
