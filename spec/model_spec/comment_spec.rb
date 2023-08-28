require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_post_comments_counter' do
    # Set up initial data before each test.
    before do
      # Create a user and post with some initial attributes.
      @user = User.create(name: 'Kingsley Abdul', photo: 'https://example.com', bio: 'I am a programmer',
                          posts_counter: 0)
      @post = Post.create(title: 'first post', text: 'captain america', author: @user, comments_counter: 0,
                          likes_counter: 0)
    end

    context 'after_save' do
      before do
        # Create a new comment associated with the user and post.
        @comment = Comment.new(user: @user, post: @post)
        # Save the comment to the database.
        @comment.save
      end

      it 'updates the post comments counter after saving a comment' do
        # Reload the post from the database and expect its comments counter to be incremented by 1.
        expect(@post.reload.comments_counter).to eq(1)
      end
    end

    context 'after_destroy' do
      before do
        # Create a new comment associated with the user and post.
        @comment = Comment.new(user: @user, post: @post)
        # Save the comment to the database.
        @comment.save
        # Destroy the comment.
        @comment.destroy
      end

      it 'updates the post comments counter after destroying a comment' do
        # Reload the post from the database and expect its comments counter to be decremented to 0.
        expect(@post.reload.comments_counter).to eq(0)
      end
    end
  end
end
