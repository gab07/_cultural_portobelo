class AddCountryOfOriginToBooks < ActiveRecord::Migration
  def change
    add_column :books, :country_of_origin, :string
  end
end
