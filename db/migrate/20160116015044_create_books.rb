class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.date :publication_year
      t.string :isbn
      t.integer :pages
      t.string :binding_type
      t.string :language
      t.decimal :price, :precision => 8, :scale => 2


      t.timestamps null: false
    end
  end
end
