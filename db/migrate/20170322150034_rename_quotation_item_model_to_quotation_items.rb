class RenameQuotationItemModelToQuotationItems < ActiveRecord::Migration
  def change
  	drop_table :quotation_items
  end
end
