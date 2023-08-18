class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: :posts_counter

  after_save :update_user_posts_counter

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end

  def new_comments
    comments.order(created_at: :desc).limit(5)
  end

  # validates :title, length: { maximum: 250 }
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
