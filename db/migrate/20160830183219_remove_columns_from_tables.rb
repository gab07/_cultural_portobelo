class RemoveColumnsFromTables < ActiveRecord::Migration
  def change
  	remove_column :books, :category_id
  	remove_column :categories, :book_id
  end
end
