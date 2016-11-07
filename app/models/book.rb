class Book < ActiveRecord::Base

	has_many :book_category_relations
	has_many :categories, through: :book_category_relations
	accepts_nested_attributes_for :book_category_relations

	has_attached_file :cover,
										:styles => { :medium => '300x300', :thumb => '100x100' }
  
  validates_attachment :cover, content_type: { content_type: /\Aimage\/.*\Z/ }
	validates :title, presence: true, :uniqueness => { case_sensitive: false }
	validates :author, presence: true
	validates :publisher, presence: true
	validates :price, presence: true
	validates :cover, presence: true
	before_save :upcase_title
	
	def upcase_title
		title.upcase!
	end

	def self.search(search)
		if search
			search_array = self.joins(:categories).where('lower(title) LIKE ? OR
																		 lower(author) LIKE ? OR
																		 lower(country_of_origin) LIKE ? OR
																		 lower(publisher) LIKE ? OR
																		 lower(categories.name) LIKE ?',
																	  "%#{search}%".downcase,
																	  "%#{search}%".downcase,
																	  "%#{search}%".downcase,
																	  "%#{search}%".downcase,
																	  "%#{search}%".downcase)
		else
			search_array = self.all
		end
		return search_array.uniq!
	end

	def self.published_books
		all.where(published: true)
	end

	def self.recent
		all.order("id DESC")
	end

	def self.random
		all.sample(16)
	end
end