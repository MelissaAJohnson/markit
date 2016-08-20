require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      @user.confirm
      sign_in @user
      @topic = FactoryGirl.create(:topic)
      @bookmark = FactoryGirl.create(:bookmark, user_id: @user.id)
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, topic_id: @topic.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, {topic_id: @topic.id, id: @bookmark.id, user_id: @user.id}
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "increases the bookmark count by 1" do
        expect{post :create, topic_id: @topic.id, user_id: @user.id, bookmark: { url: Faker::Internet.url }}.to change(Bookmark,:count).by(1)
      end
    end

    describe "GET #edit" do
      it "returns http redirect" do
        get :edit, topic_id: @topic.id, id: @bookmark.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "PUT update" do
      it "returns the correct title" do
        new_bookmark = "Updated bookmark"
        put :update, topic_id: @topic.id, id: @bookmark.id, user_id: @user.id, bookmark: {url: new_bookmark }
        updated_bookmark = assigns(:bookmark)
        expect(updated_bookmark.url).to eq(new_bookmark)
      end
    end

    describe "DELETE destroy" do
      it "deletes the bookmark" do
        delete :destroy, topic_id: @topic.id, user_id: @user.id, id: @bookmark.id
        count = Bookmark.where({id: @bookmark.id}).size
        expect(count).to eq 0
      end
    end
  end

  context 'non-user' do

  end

end
