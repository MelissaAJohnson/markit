require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  before do
    @user = User.create!(email: 'member@example.com', password: 'helloworld', password_confirmation: 'helloworld')
    @user.confirm
    sign_in @user
    @my_topic = Topic.create!(title: Faker::Lorem.word, user: @user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: @my_topic.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: @my_topic.id}
      expect(response).to render_template :show
    end

    it "assigns my_topic to @topic" do
      get :show, {id: @my_topic.id}
      expect(assigns(:topic)).to eq(@my_topic)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: @my_topic.id}
      expect(response).to have_http_status(:success)
    end
  end

end
