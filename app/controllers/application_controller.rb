class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Before any page loads, find the current user.
  # The find_current_cuser method wont work otherwise.
  before_action :find_current_cuser

  # This is our own method (not convention)
  def find_current_cuser
    if session[:user_id].present?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end



end
