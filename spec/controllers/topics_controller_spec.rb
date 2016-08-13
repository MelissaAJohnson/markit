require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:title) { Faker::Lorem.word }
  let(:user) { User.create!(email: 'member@example.com', password: 'helloworld') }
  let (:my_topic) { Topic.create!(title: title, user: user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_topic.id}
      expect(response).to have_http_status(:success)
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
      get :edit, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
  end

end
