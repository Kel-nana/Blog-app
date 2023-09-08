class Api::V1::UsersController < ApplicationController
  # http://[::1]:3000/api/v1/users/
  def index
    users = User.all
    render json: users, status: :ok
  end
end
