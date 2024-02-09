class Api::V1::PostsController < ApplicationController
  # http://[::1]:3000/api/v1/users/2/posts
  def index
    user = User.find(params[:user_id])
    posts = user.posts

    render json: posts, status: :ok
  end
end
