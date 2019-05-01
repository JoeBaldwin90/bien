class BookmarksController < ApplicationController

  before_action :check_login

  def create
    # Find review we're bookmarking (can get this from `rails routes` in Terminal)
    @review = Review.find(params[:review_id])

    @bookmark = @review.bookmarks.new
    @bookmark.user = @current_user

    @bookmark.save

    redirect_to review_path(@review)
  end


end
