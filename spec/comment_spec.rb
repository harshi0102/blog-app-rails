require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user, name: 'John Doe', posts_counter: 0) }
  let(:post) { FactoryBot.create(:post, author: user, title: 'Sample Post', likes_counter: 0, comments_counter: 0) }
  let(:comment) { Comment.new(post:, user:, text: 'Sample Comment') }

  describe '#update_post_comments_counter' do
    it 'updates the post comments_counter attribute' do
      comment.save
      post.reload
      updated_comments_counter = post.comments_counter
      expect(updated_comments_counter).to eq(1)
    end
  end
end
