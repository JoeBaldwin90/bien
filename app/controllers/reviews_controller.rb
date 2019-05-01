class ReviewsController < ApplicationController

  # Check if logged in
  before_action :check_login, except: [:index, :show]


  def index
    # Add a filters for price, cuisine & location.
    # This can be done in the URL e.g. "..:3000/location=London"
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]
    # Start with all Reviews
    @reviews = Review.all

    # Filter results by price
    if @price.present?
      @reviews = @reviews.where(price: @price) # @price is the variable parameter
    end

    # Filter by cuisine
    if @cuisine.present?
      @reviews = @reviews.where(cuisine: @cuisine) # @cuisine is the variable parameter
    end

    # Filter & search by location
    if @location.present?
      @reviews = @reviews.near(@location)
    end

  end

  def new
    # the form for the new review
    @review = Review.new
  end

  def create
    # take info from form and add to model
    @review = Review.new(form_params)

    # assign review to the current user
    @review.user = @current_user


    # Check if the model can be saved.
    # If it is, navigate to homepage.
    # If no, show the new form.
    if @review.save
      # If the form data passes the validation checks on our review.db model, redirect to homepage.
      redirect_to root_path
    else
    # Else show the view for new.html.erb (the form)
      render "new"
    end

  end

  def show
    # individual review page
    @review = Review.find(params[:id])
  end

  def destroy
    #find review
    @review = Review.find(params[:id])

    # delete review if user ID matches the review author ID
    if @review.user == @current_user
      @review.destroy
    end

    #redirect to homepage
    redirect_to root_path
  end

  def edit
    # find review
    @review = Review.find(params[:id])

    # Use if statement to prevent users hacking the URL and editing reviews they haven't written.
    if @review.user != @current_user
      redirect_to root_path
    end

  end

  def update
    # Find review
    @review = Review.find(params[:id])

    if @review.user != @current_user
      redirect_to root_path
    else
      if @review.update(form_params) # If no errors, update with new info
        redirect_to review_path(@review) #Redirect to show
      else
        render "edit" # Show edit page
      end
    end
  end

  def form_params
    params.require(:review).permit(:title, :body, :score, :restaurant, :cuisine, :ambiance, :price, :address)
  end

end
