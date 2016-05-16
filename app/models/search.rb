class Search < ActiveRecord::Base

	def books
		@books ||= find_books
	end


	def find_books

		books = Book.all

		books = books.where(["title LIKE ?","%#{keywords}%"]) if keywords.present?
		books = books.where(["category LIKE ?",category]) if category.present?
		books = books.where(["price >= ?", min_price]) if min_price.present?
		books = books.where(["price <= ?", max_price]) if max_price.present?
		books = books.where(["isbn LIKE ?", isbn]) if isbn.present?
		books = books.order(:title)

		books
		
	end
end
