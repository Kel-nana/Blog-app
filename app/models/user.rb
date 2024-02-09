class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  before_validation :initialize_posts_counter, on: :create

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true

  validates :posts_counter, numericality: { only_integer: true },
                            comparison: { greater_than_or_equal_to: 0 }

  def new_posts
    posts.order(created_at: :desc).limit(3)
  end

  def initialize_posts_counter
    self.posts_counter ||= 0
  end
end
