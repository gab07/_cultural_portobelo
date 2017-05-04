class Client < ActiveRecord::Base
	belongs_to :quotation
	accepts_nested_attributes_for :quotation
end
