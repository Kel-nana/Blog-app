class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:author, comments: [:author]).where(author: { id: params[:user_id] })
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])

    # Initialize counters to 0 if they are nil
    @post.comments_counter ||= 0
    @post.likes_counter ||= 0
    @comments = @post.comments
  end

  # Initialize a new post object
  def new
    @post = Post.new
  end

  # Create a new post with author, comments, and likes counters
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    # Attempt to save the new post to the database
    if @post.save
      # If successful, redirect to the user's posts with a success notice
      redirect_to user_posts_path(current_user, @post.id), notice: 'Post created successfully.'
    else
      # If saving fails, set an error flash message and re-render the 'new' template
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end



  private

  # parameters for post creation
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
