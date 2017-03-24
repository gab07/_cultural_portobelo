class RenameQuotationItemTable < ActiveRecord::Migration
  def change
  	rename_table :quotation_item, :quotation_items
  end
end
