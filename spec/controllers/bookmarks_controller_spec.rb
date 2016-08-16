require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  before do
    @user = User.create!(email: 'member@example.com', password: 'helloworld', password_confirmation: 'helloworld')
    @user.confirm
    sign_in @user
    @my_topic = Topic.create!(title: Faker::Lorem.word, user: @user)
    @bookmark = Bookmark.create!(url: Faker::Internet.url, topic: @my_topic)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: @my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
        get :new, topic_id: @my_topic.id
        expect(response).to render_template :new
      end

    it "instantiates @bookmark" do
      post :create, topic_id: @my_topic.id, bookmark: { url: Faker::Internet.url }
      expect(assigns(:bookmark)).not_to be_nil
    end
  end

  describe "POST create" do
    it "returns http redirect" do
      post :create, topic_id: @my_topic.id, bookmark: { url: Faker::Internet.url }
      expect(response).to redirect_to(@my_topic)
    end
  end

  describe "GET #edit" do
    it "returns http redirect" do
      get :edit, topic_id: @my_topic.id, id: @bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT update" do
    it "returns http redirect" do
      url = Faker::Internet.url
      put :update, topic_id: @my_topic.id, id: @bookmark.id, bookmark: {url: url}
      expect(response).to redirect_to(@my_topic)
    end
  end

  describe "DELETE destroy" do
    it "deletes the bookmark" do
      delete :destroy, topic_id: @my_topic.id, id: @bookmark.id
      count = Bookmark.where({id: @bookmark.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic" do
      delete :destroy, topic_id: @my_topic.id, id: @bookmark.id
      expect(response).to redirect_to topics_path
    end
  end
end
