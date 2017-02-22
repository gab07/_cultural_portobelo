class Quotation < ActiveRecord::Base
	belongs_to :user
	has_many :clients

	has_many :quotation_book_relations
	has_many :books, through: :quotation_book_relations

	before_save :update_subtotal

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

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

	private
  def set_order_status
    self.order_status = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
	
end