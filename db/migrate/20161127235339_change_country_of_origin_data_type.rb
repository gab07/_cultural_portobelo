class ChangeCountryOfOriginDataType < ActiveRecord::Migration
  def change
  	change_column :books, :country_of_origin, :string
  end
end
