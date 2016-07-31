class ChangeDateInBooks < ActiveRecord::Migration
  def change
  	change_column :books, :publication_year, :string
  end
end
