class QuotationBookRelation < ActiveRecord::Base
belongs_to :quotation
belongs_to :book
end
