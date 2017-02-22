class CreateQuotationBookRelations < ActiveRecord::Migration
  def change
    create_table :quotation_book_relations do |t|
      t.integer :quotation_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
