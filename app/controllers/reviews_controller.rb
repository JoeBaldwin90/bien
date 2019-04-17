class ReviewsController < ApplicationController

  def index
    # this is our list page for our reviews
    @reviews = Review.all
  end

  def new
    # the form for the new review
    @review = Review.new
  end

  def create
    # take info from form and add to model
    @review = Review.new(form_params)

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
    # delete review
    @review.destroy
    #redirect to homepage
    redirect_to root_path
  end

  def edit
    # find review
    @review = Review.find(params[:id])
  end

  def update
    # find review
    @review = Review.find(params[:id])

    if @review.update(form_params) # If no errors, update with new info
      redirect_to review_path(@review) #Redirect to show
    else
      render "edit" #show edit page
    end
  end

  def form_params
    params.require(:review).permit(:title, :body, :score, :restaurant, :cuisine, :ambiance, :price)
  end

end
