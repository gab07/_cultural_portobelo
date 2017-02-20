class Quotation < ActiveRecord::Base
	belongs_to :user
	has_one :client
	has_many :books, through: :quotation_book_relations

	# Search functionality query for books
	def self.search(search)
	  if search
	    search_array = self.joins(:categories).where('lower(title) LIKE ? OR
	                                   lower(author) LIKE ? OR
	                                   lower(publisher) LIKE ? OR
	                                   lower(country_of_origin) LIKE ? OR
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
end
