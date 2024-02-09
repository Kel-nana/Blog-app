class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_url(@post.author, @post), notice: 'Comment created successfully.'
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      redirect_to user_post_url(@post.author, @post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment # Check authorization using CanCanCan

    if @comment.destroy
      flash[:notice] = 'Comment deleted successfully.'
    else
      flash[:alert] = 'Failed to delete the comment.'
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
