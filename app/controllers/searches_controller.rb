class SearchesController < ApplicationController
	def new 
		@search = Search.new
		@categories = Book.uniq.pluck(:category)
		@books = Book.search(params[:search])
	end

	def create
		@search = Search.create!(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@categories = Book.uniq.pluck(:category)
		@books = Book.search(params[:search])
	end

	def update
		@search = Search.find params[:id]
		  if @search.update(search_params)
        redirect_to @search
      else
        render :edit
      end
	end


	private

	def search_params
		params.require(:search).permit(:keywords, :category, :min_price, :max_price, :isbn)
	end

end
