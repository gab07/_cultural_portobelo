class AddNewToBooksTable < ActiveRecord::Migration
  def change
    add_column :books, :new, :boolean
  end
end
