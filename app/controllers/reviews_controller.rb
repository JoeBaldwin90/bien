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
    # take info from form and add to database
    @review = Review.new(form_params)
    # save to database
    @review.save
    # redirect to homepage
    redirect_to root_path
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
    # update with new info
    @review.update(form_params)
    #redirect to homepage
    redirect_to review_path(@review)
  end

  def form_params
    params.require(:review).permit(:title, :body, :score)
  end

end
