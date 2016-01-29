class Search < ActiveRecord::Base

	def search_books

		books = Book.all

		books = books.where(["title LIKE ?","%#{keywords}%"]) if keywords.present?
		books = books.where(["category LIKE ?",category]) if category.present?
		books = books.where(["price >= ?", min_price]) if min_price.present?
		books = books.where(["price <= ?", max_price]) if max_price.present?
		books = books.where(["isbn LIKE ?", isbn]) if isbn.present?

		return books
		
	end
end
