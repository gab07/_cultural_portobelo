class Category < ActiveRecord::Base
	has_many :book_category_relations
	has_many :books, through: :book_category_relations

	accepts_nested_attributes_for :book_category_relations, :books

	validates :name, uniqueness: true

	def self.recent
		all.order("name ASC")
	end
end
