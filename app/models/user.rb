class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  before_create :initialize_posts_counter

  validates :name, presence: true

  def new_posts
    posts.order(created_at: :desc).limit(3)
  end

  def initialize_posts_counter
    self.posts_counter ||= 0
  end
end
