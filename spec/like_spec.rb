require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user, name: 'John Doe', posts_counter: 0) }
  let(:post) { create(:post, author: user, title: 'Sample Post', comments_counter: 0, likes_counter: 0) }
  let(:like) { build(:like, post:, user:) }

  describe '#update_post_likes_counter' do
    it 'updates the post likes_counter attribute' do
      like.save
      post.reload
      expect(post.likes_counter).to eq(post.likes.count)
    end
  end
end
