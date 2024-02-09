class ApplicationController < ActionController::Base
  # Method to retrieve the currently logged-in user
  def current_user
    @current_user = User.first
  end

  # Make the current_user method available to views
  helper_method :current_user
end
