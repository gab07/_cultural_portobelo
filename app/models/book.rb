class Book < ActiveRecord::Base
	has_many :book_category_relations
	has_many :categories, through: :book_category_relations

	accepts_nested_attributes_for :book_category_relations, :categories

	has_attached_file :cover,
										:styles => { :medium => '300x300', :thumb => '100x100' }
  validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }

	validates :title, presence: true
	validates :author, presence: true
	validates :publisher, presence: true
	validates :price, presence: true
	validates :cover, presence: true

	scope :search, -> query { where("lower(title) LIKE ? OR lower(author) LIKE ? OR lower(publisher) LIKE ? OR lower(publication_year) LIKE ? OR lower(country_of_origin) LIKE ? OR lower(description) LIKE ?", 
      "%#{query}%".downcase, "%#{query}%".downcase, "%#{query}%".downcase, "%#{query}%".downcase, "%#{query}%".downcase, "%#{query}%".downcase) }

	def self.recent
		all.order("id DESC")
	end
end