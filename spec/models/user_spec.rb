require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:bookmarks) }
  it { is_expected.to have_many(:likes) }

  describe "like_for(bookmark)" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    it "returns 'nil' if the user has not liked the bookmark" do
      expect(@user.liked(@bookmark)).to be_nil
    end
  end
end
