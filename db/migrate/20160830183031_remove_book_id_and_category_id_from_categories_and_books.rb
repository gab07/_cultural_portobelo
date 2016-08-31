class RemoveBookIdAndCategoryIdFromCategoriesAndBooks < ActiveRecord::Migration
  def change
  	remove_foreign_key :books, column: :category_id
  	remove_foreign_key :categories, column: :book_id
  end
end
