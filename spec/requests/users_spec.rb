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
      get "/users/:id"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      post "/users/create"
      expect(response).to have_http_status(:success)
    end
  end
end
