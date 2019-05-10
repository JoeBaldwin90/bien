class UsersController < ApplicationController

  def index

    # Start with all Users
    @users = User.all

  end

  def show
    # Vanity URL to hide number of users
    @user = User.find_by(username: params[:id])

  end

  def new
    # form for adding a new user
    @user = User.new

  end

  def create
    # form for adding a new user
    @user = User.new(form_params)

    # Check if the user can be saved.
    # If it is, save session & navigate to homepage.
    # If no, show the new form.
    if @user.save
      # Save session with user
      session[:user_id] = @user.id

      flash[:success] = "Welcome to Bien"

      # If the form data passes the validation checks in the user.rb model, redirect to list of users.
      redirect_to reviews_path
    else
      # Else show the form again with error messages
      render "new"
    end

  end

  def form_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :photo)
  end


end
