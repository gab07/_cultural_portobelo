class RemoveBookIdFromCategories < ActiveRecord::Migration
  def self.down
  	remove_column :books, :category_id
  	remove_column :categories, :book_id
  end
end
