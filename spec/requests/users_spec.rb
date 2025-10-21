require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns a list of users with pagination" do
      create_list(:user, 15)
      
      get "/users", params: { page: 1, per_page: 10 }
      
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['users'].length).to eq(10)
      expect(json['meta']['page']).to eq(1)
      expect(json['meta']['total_count']).to eq(15)
    end
  end

  describe "GET /users/:id" do
    it "returns a user" do
      user = create(:user)

      get "/users/#{user.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(user.id)
      expect(json['email']).to eq(user.email)
    end

    it "returns 404 for non-existent user" do
      get "/users/99999"
      
      expect(response).to have_http_status(:not_found)
      json = JSON.parse(response.body)
      expect(json['error']).to be_present
    end
  end

  describe "POST /users" do
    it "creates a new user" do
      user_params = { user: { name: "John Doe", email: "john@example.com" } }

      expect {
        post "/users", params: user_params
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json['name']).to eq("John Doe")
    end

    it "returns 422 for invalid user" do
      user_params = { user: { name: "", email: "invalid" } }
      
      post "/users", params: user_params
      
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json['error']).to be_present
    end
  end

  describe "PATCH /users/:id" do
    it "updates a user" do
      user = create(:user)

      patch "/users/#{user.id}", params: { user: { name: "Updated Name" } }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['name']).to eq("Updated Name")
    end
  end

  describe "DELETE /users/:id" do
    it "deletes a user" do
      user = create(:user)
      
      expect {
        delete "/users/#{user.id}"
      }.to change(User, :count).by(-1)
      
      expect(response).to have_http_status(:no_content)
    end
  end
end

