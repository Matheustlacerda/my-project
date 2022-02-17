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

  describe "GET /new" do
    it "returns http success" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post /create user" do
    it "returns http success" do
      post users_path, params: {user: {name: "Jane"}}
      expect(response).to have_http_status(:found)
    end
  end
end
