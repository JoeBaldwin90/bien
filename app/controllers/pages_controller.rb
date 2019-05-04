class PagesController < ApplicationController

  def about
    @content = Page.find_by(url: "about")
  end

end
