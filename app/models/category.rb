class Category < ActiveRecord::Base
	has_many :books, through: :book_category_relations
	has_many :book_category_relations

	validates :name, uniqueness: true
end
