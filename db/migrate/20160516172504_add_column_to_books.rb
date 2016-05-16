class AddColumnToBooks < ActiveRecord::Migration
  def self.down
  	add_column :books, :country_of_origin, :string
  end
end
