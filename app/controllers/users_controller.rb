class UsersController < ApplicationController
  def index
    @users = User.all
    #  @users.each do |user|
    #   puts "User ID: #{user.id}, Name: #{user.name}, Email: #{user.email}"
    # end
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.new_posts
  end
end
