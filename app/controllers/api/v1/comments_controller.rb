class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource

  #   http://[::1]:3000/api/v1/users/6/posts/17/comments/
  def index
    @user = User.find(params[:user_id])
    post = @user.posts.find(params[:post_id])
    comments = post.comments

    render json: comments, status: :ok
  end

  #   http://[::1]:3000/api/v1/users/6/posts/17/comments/35/
  def show
    comment = Comment.find(params[:id])

    render json: comment, status: :ok
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], user_id: current_user, post_id: @post.id)
    if @comment.save
      render json: @comment
    else
      render error: { error: 'Unable to create comments' }, status: 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
