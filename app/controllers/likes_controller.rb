class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)
    if @like.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id), notice: 'Post liked successfully.'
    else
      flash[:alert] = 'Unable to like the post.'
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    end
  end
end
