class AddIndexToQuoationItems < ActiveRecord::Migration
  def change
  	add_index :quotation_items, :quotation_id
  	add_index :quotation_items, :book_id
  end
end
