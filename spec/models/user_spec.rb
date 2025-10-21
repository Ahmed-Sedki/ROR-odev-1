require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many posts' do
      user = create(:user)
      post1 = create(:post, user: user)
      post2 = create(:post, user: user)
      expect(user.posts).to include(post1, post2)
    end

    it 'has many comments' do
      user = create(:user)
      comment1 = create(:comment, user: user)
      comment2 = create(:comment, user: user)
      expect(user.comments).to include(comment1, comment2)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = build(:user, name: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid with invalid email format' do
      user = build(:user, email: 'invalid')
      expect(user).not_to be_valid
    end

    it 'is not valid with duplicate email' do
      create(:user, email: 'test@example.com')
      user = build(:user, email: 'test@example.com')
      expect(user).not_to be_valid
    end
  end
end
