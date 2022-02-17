require 'rails_helper'

describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "returns a user list" do
      users = User.all
      get users_path
      expect(assigns(:users)).to eq(users)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      user = User.create(name:'John')
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it "returns a single user" do
      user = User.create(name:'John')
      get user_path(user)
      expect(assigns(:user)).to eq(user)
    end
  end
end
