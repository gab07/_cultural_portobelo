class Client < ActiveRecord::Base
	belongs_to :quotation

		# This permits you create clients from Quotation new form
	accepts_nested_attributes_for :quotation
end
