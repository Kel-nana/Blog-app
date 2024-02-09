class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_commit :update_post_comments_counter, on: %i[create destroy]

  private

  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
