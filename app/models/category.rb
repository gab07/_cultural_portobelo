class Category < ActiveRecord::Base
	has_many :books, through: :book_category_relations
	has_many :book_category_relations

	accepts_nested_attributes_for :book_category_relations, :books

	validates :name, uniqueness: true

	def book_category(data) 
		@categories = Book.includes(:categories).where("category.name = '#{data}'").references(:categories)
	end

end
