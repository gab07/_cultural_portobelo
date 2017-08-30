class SitesController < ApplicationController
	def index
		@books = Book.published_books.recent
	end
end
