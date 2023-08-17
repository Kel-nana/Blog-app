class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: :posts_counter
  
    after_save :update_user_posts_counter
  
    def update_user_posts_counter
      author.increment!(:posts_counter)
    end
  
    def new_comments
      comments.order(created_at: :asc).limit(5)
    end
  end