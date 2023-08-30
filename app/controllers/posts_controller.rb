class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    # Initialize counters to 0 if they are nil
    @post.comments_counter ||= 0
    @post.likes_counter ||= 0
    @comments = @post.comments
  end
end
