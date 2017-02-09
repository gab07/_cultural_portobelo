class AddDefaultFalseToFirstPage < ActiveRecord::Migration
  def change
  	change_column :books, :first_page, :boolean, default: false
  end
end
