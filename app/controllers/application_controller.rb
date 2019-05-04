class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Before any page loads, find the current user.
  # The find_current_user method wont work otherwise.
  before_action :find_current_user

  # Add method to use in views.
  helper_method :is_logged_in?

  # This is our own method (not convention)
  def find_current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # Check login status
  def check_login
    # unless can be used to replace an if/else when there is no action to take if the IF is true.
    unless is_logged_in?
      redirect_to new_session_path
    end
  end

  # Is the person logged in?
  # By creating method, it can be used elsewhere to simplify the code
  def is_logged_in?
    session[:user_id].present?
  end

  # Check Admin status
  def check_admin
    @current_user = find_current_user

    unless @current_user.present? and @current_user.is_admin?
      redirect_to root_path
    end
  end

  # Find admin users
  def find_admin_user
    @current_user = find_current_user

    if @current_user.present? and @current_user.is_admin?
      @current_user
    else
      nil
    end
  end

end
