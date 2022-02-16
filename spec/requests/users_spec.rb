require 'rails_helper'

describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end

    it "returns a user list" do
      users = User.all
      get "/users"
      expect(assigns(:users)).to eq(users)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      user = User.create(name:'Jane')
      get "/users/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post /create" do
    it "returns http success" do
      user = User.create(name:'Jane')
      get "/users/1"
      expect(response).to have_http_status(:success)
    end

    it "returns a user" do
      user = User.create(name:'Jane')
      get "/users/1"
      expect(assigns(:user)).to eq(user)
    end
  end
end