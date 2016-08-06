class Category < ActiveRecord::Base
	has_many :books, through: :book_category_relations
	has_many :book_category_relations

	accepts_nested_attributes_for :books

	validates :name, uniqueness: true
end
