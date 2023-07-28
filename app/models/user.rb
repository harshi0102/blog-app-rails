class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes

  validates :name, presence: true

  def update_posts_counter
    update(posts_counter: posts.count)
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
