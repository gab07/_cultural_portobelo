class QuotationItem < ActiveRecord::Base
	belongs_to :book
	belongs_to :quotation

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validate :book_present
	validate :quotation_present

	def unit_price
	  if persisted?
	    self[:unit_price]
	  else
	    book.price
	  end
	end

	def total_price
	  unit_price * quantity
	end

	private
  def book_present
    if book.nil?
      errors.add(:book, "is not valid or is not active.")
    end
  end

  def quotation_present
    if quotation.nil?
      errors.add(:quotation, "is not a valid quotation.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end