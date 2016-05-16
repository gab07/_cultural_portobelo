class RemoveCategoryIdFromBooksAndAddBookIdToCategory < ActiveRecord::Migration
  def change
  	remove_column :books, :category_id
  	add_column :categories, :book_id, :integer, index:true
  end
end
