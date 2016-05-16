class CreateBookCategoryRelations < ActiveRecord::Migration
  def change
    create_table :book_category_relations do |t|
      t.integer :book_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
