class AddFirstPageToBooks < ActiveRecord::Migration
  def change
    add_column :books, :first_page, :boolean
  end
end
