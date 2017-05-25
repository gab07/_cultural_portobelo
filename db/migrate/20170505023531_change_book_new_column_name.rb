class ChangeBookNewColumnName < ActiveRecord::Migration
  def change
  	rename_column :books, :new, :new_book
  end
end
