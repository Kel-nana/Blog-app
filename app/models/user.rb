class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  def new_posts
    posts.order(created_at: :asc).limit(3)
  end

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true },
                            comparison: { greater_than_or_equal_to: 0 }
end
