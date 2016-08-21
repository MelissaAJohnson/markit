require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  context 'guest user' do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    describe 'POST create' do
      it 'redirects the user to the sign in view' do
        post :create, { bookmark_id: @bookmark.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'signed in user' do
    before do
      @user = FactoryGirl.create(:user)
      @user.confirm
      sign_in @user
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark)
    end

    describe 'POST create' do
      it 'creates a like for the current user and specified bookmark' do
        expect(@user.likes.find_by_bookmark_id(@bookmark_id)).to be_nil
        post :create, { bookmark_id: @bookmark.id }
        expect(@user.likes.find_by_bookmark_id(@bookmark.id)).not_to be_nil
      end
    end
  end
end
