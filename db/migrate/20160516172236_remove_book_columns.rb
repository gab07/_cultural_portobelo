class RemoveBookColumns < ActiveRecord::Migration
  def self.up
  	remove_column :books, :isbn
  	remove_column :books, :language
  	remove_column :books, :binding_type
  	remove_column :books, :pages
  	remove_column :books, :category
  end
end
