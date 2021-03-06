class SessionsController < ApplicationController

  def new
    # Log-in form

  end

  def create
    # Try to log-in
    @form_data = params.require(:session)

    # Pull username and password from the form form dta
    @username = @form_data[:username]
    @password = @form_data[:password]

    # Check user's credentials
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # If user exists, redirect to homepage. If not, return to login page.
    if @user
      # Save this user to the user's "session" which is a hash built into Rails
      session[:user_id] = @user.id
      flash[:success] = "Welcome back" 
      redirect_to root_path
    else
      render "new"
    end


  end

  def destroy
    # Log-out
    # Remove session completely "reset_session" is built into Rails
    reset_session

    flash[:success] = "You've logged out!"

    # Redirect to login page
    redirect_to new_session_path
  end

end
