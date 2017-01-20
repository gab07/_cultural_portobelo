class SitesController < ApplicationController
	def index
		if params[:search]
      @books = Book.published_books.search(params[:search]).paginate(:page => params[:page], :per_page => 12)
    else
      @books = Book.published_books.recent.paginate(:page => params[:page], :per_page => 12)
  	end
	end
end
