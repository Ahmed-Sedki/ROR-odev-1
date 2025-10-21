require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "returns a list of posts" do
      posts = create_list(:post, 5)

      get "/posts"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['posts']).to be_an(Array)
      expect(json['posts'].length).to be >= 1
      expect(json['meta']).to be_present
    end

    it "filters posts by user_id" do
      user = create(:user)
      user_posts = create_list(:post, 3, user: user)
      other_posts = create_list(:post, 2)

      get "/posts", params: { user_id: user.id }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['posts']).to be_an(Array)
      expect(json['posts'].all? { |p| p['user']['id'] == user.id }).to be true
    end

    it "filters posts by category_id" do
      category = create(:category)
      category_posts = create_list(:post, 3, category: category)
      other_posts = create_list(:post, 2)

      get "/posts", params: { category_id: category.id }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['posts']).to be_an(Array)
      expect(json['posts'].all? { |p| p['category']['id'] == category.id }).to be true
    end

    it "filters posts by tag name" do
      tag = create(:tag, name: "ruby")
      post1 = create(:post)
      post2 = create(:post)
      create(:post_tag, post: post1, tag: tag)
      create(:post_tag, post: post2, tag: tag)
      other_post = create(:post)

      get "/posts", params: { tag: "ruby" }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['posts']).to be_an(Array)
      expect(json['posts'].length).to be >= 1
    end
  end

  describe "GET /posts/:id" do
    it "returns a post with associations" do
      post = create(:post)
      tag = create(:tag)
      create(:post_tag, post: post, tag: tag)

      get "/posts/#{post.id}"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['id']).to eq(post.id)
      expect(json['user']).to be_present
      expect(json['category']).to be_present
      expect(json['tags']).to be_present
    end
  end

  describe "POST /posts" do
    it "creates a new post" do
      user = create(:user)
      category = create(:category)
      post_params = { 
        post: { 
          title: "Test Post", 
          body: "Test body content", 
          user_id: user.id, 
          category_id: category.id 
        } 
      }
      
      expect {
        post "/posts", params: post_params
      }.to change(Post, :count).by(1)
      
      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /posts/:id/tags" do
    it "returns tags for a post" do
      post = create(:post)
      tag1 = create(:tag)
      tag2 = create(:tag)
      create(:post_tag, post: post, tag: tag1)
      create(:post_tag, post: post, tag: tag2)

      get "/posts/#{post.id}/tags"

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
    end
  end
end

